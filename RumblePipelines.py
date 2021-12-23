def get_clf(mode, outputCol="transformedFeatures", **kwargs):
    '''
    Code returning mllib classifier for pipelines
    '''
    clf = ''
    if mode == 'logistic':
        clf = ('$logisticregression','LogisticRegression')
        res = [(f'{clf[0]}',f'get-estimator("{clf[1]}", {{"featuresCol": "{outputCol}", "maxIter": 5}})')]
    elif mode=='RandomForest':
        clf = ('$randomforest','RandomForestClassifier')
        res = [(f'{clf[0]}',f'get-estimator("{clf[1]}", {{"featuresCol": "{outputCol}", "numTrees": 5}})')]
    elif mode=='LinearSVC':
        clf = ('$linearsvc','LinearSVC')
        res = [(f'{clf[0]}',f'get-estimator("{clf[1]}", {{"featuresCol": "{outputCol}", "maxIter": 5}})')]
    elif mode=='NB':
        clf = ('$naivebayes','NaiveBayes')
        res = [(f'{clf[0]}',f'get-estimator("{clf[1]}", {{"featuresCol": "{outputCol}"}})')]
    return res
    

def get_pipe_ops(mode, inputCol="features", outputCol="transformedFeatures"):

    # features
    #vector = ('$vector-assembler',f'get-transformer("VectorAssembler", {{"inputCols" : {inputCol}, "outputCol" : "features"}})')
    #ops = [vector]
    ops = []

    if mode == 'pipe_0':
        # just the classifier
        vector_2 = ('$vector-assembler_2',f'get-transformer("VectorAssembler", {{"inputCols" : ["features"], "outputCol" : "{outputCol}"}})')
        ops = ops + [vector_2] 

    elif mode == 'pipe_1':
        # 1-step scaler (*map)
        scaler = ('$scaler',f'get-estimator("MaxAbsScaler", {{"inputCol": "features", "outputCol": "{outputCol}"}})')
        ops = ops + [scaler]

    # elif mode == 'pipe_2':
        # 2-step function scaler (*map)
        # def logVar(x):
        #     return StandardScaler(np.log(x))
        # ops = [('logscaler', FunctionTransformer(logVar))]

    elif mode == 'pipe_3':
        # dimensionality reduction (*map)
        pca = ('$pca',f'get-estimator("PCA", {{"inputCol": "features", "outputCol": "{outputCol}", "k": 2}})')
        ops = ops + [pca]

    # elif mode == 'pipe_4':
        # k-means (fork)
        # union = FeatureUnion([("indicator", MissingIndicator()),
        #                ("kmeans", KMeans(random_state=0))])
        # ops = [('union', union)]

    elif mode == 'pipe_5':
        # TODO
        # multiple dimensionality reductions (fork)
        pca = ('$pca',f'get-estimator("PCA", {{"inputCol": "features", "outputCol": "pca_1_output", "k": 2}})')
        svd = ('$pca2',f'get-estimator("PCA", {{"inputCol": "features", "outputCol": "pca_2_output", "k": 3}})')
        #svd = SVD()
        #lda = LDA()
        vecAssembler = ('$vector-assembler_2',f'get-transformer("VectorAssembler", {{"inputCols" : ["pca_1_output","pca_2_output"], "outputCol" : "{outputCol}"}})')

        ops = ops + [pca, svd, vecAssembler]

    # elif mode == 'pipe_6':
    #     # image blurring operator
    #     grayify = RGB2GrayTransformer()
    #     def gaussian_blur(x):
    #         return skimage.filters.gaussian(x)
    #     ops = [('grayify', grayify), ('blur', FunctionTransformer(gaussian_blur))]

    # elif mode == 'pipe_7':
    #     # complex image processing operators
    #     grayify = RGB2GrayTransformer()
    #     hogify = HogTransformer(
    #         pixels_per_cell=(4, 4), 
    #         cells_per_block=(2,2), 
    #         orientations=9, 
    #         block_norm='L2-Hys'
    #     )
    #     ops = [('grayify', grayify), ('hogify', hogify)]

    else:
        raise ValueError("Invalid mode!")

    return ops

def _extract_definitions(ops):
    res = ''
    for op in ops:
        res = res + f'let {op[0]} := {op[1]}\n'
    return res

def _create_pipeline(ops):
    arr = '['
    for op in ops[:-1]:
        arr += f'{op[0]}, '
    arr += f'{ops[-1][0]}]'
    res = f'get-estimator("Pipeline", {{"stages": {arr}}})'
    return res

def create_rumble_program(ops_mode, clf_mode='logistic', accuracy=True, k=0, dataset='YFCC', **kwargs):

    pipe_ops = get_pipe_ops(ops_mode)
    clf = get_clf(clf_mode, **kwargs)

    ops = pipe_ops + clf

    definitions = _extract_definitions(ops)
    pipeline = _create_pipeline(ops)

    # data_type = 'declare type local:mytype as {"id": "integer", "label": "integer", "col1": "decimal", "col2": "decimal", "col3": "decimal"};'
    # tr_data = """validate type local:mytype* {
    # {"id": 0, "label": 1, "col1": 0.0, "col2": 1.1, "col3": 0.1},
    # {"id": 1, "label": 0, "col1": 2.0, "col2": 1.0, "col3": -1.0},
    # {"id": 2, "label": 0, "col1": 2.0, "col2": 1.3, "col3": 1.0},
    # {"id": 3, "label": 1, "col1": 0.0, "col2": 1.2, "col3": -0.5}
    # }"""
    # test_data = """validate type local:mytype* {
    # {"id": 0, "label": 1, "col1": -1.0, "col2": 1.5, "col3": 1.3},
    # {"id": 1, "label": 0, "col1": 3.0, "col2": 2.0, "col3": -0.1},
    # {"id": 2, "label": 1, "col1": 0.0, "col2": 2.2, "col3": -1.5}
    # }"""

    if dataset == 'Criteo':
        if k == 0:
            tr_data = """parquet-file("s3://rumbleml-data/output/output.parquet")"""
            test_data = """parquet-file("s3://rumbleml-data/criteo.kaggle2014.test.parquet")"""
            total = 6042135
        else:
            tr_data = f'parquet-file("s3://rumbleml-data/criteo_{k}/train.parquet")'
            test_data = f'parquet-file("s3://rumbleml-data/criteo_{k}/test.parquet")'
            total = k
    elif dataset == 'YFCC':
        if k == 0:
            tr_data = """parquet-file("s3://rumbleml-data/YFCC100M_train.parquet")"""
            test_data = """parquet-file("s3://rumbleml-data/YFCC100M_test.parquet")""" 
            total = 540223
        else:
            tr_data = f'parquet-file("s3://rumbleml-data/yfcc_{k}/train.parquet")'
            test_data = f'parquet-file("s3://rumbleml-data/yfcc_{k}/test.parquet")'
            total = k
    else:
        raise(ValueError)

    if accuracy:
        program = (
            # f'{data_type}\n'
            f'let $training-data := {tr_data}\n'
            f'let $test-data := {test_data}\n'
            f'{definitions}'
            f'let $pipeline := {pipeline}\n'
            f'let $pip := $pipeline($training-data, {{}})\n'
            f'let $prediction := $pip($test-data, {{}})\n'
            f'let $total := {total}\n' 
            f'return count($prediction[$$.label eq $$.prediction]) div $total'
        )
    else:
        program = (
            # f'{data_type}\n'
            f'let $training-data := {tr_data}\n'
            f'let $test-data := {test_data}\n'
            f'{definitions}'
            f'let $pipeline := {pipeline}\n'
            f'let $pip := $pipeline($training-data, {{}})\n'
            f'return $pip($test-data, {{}})'
        )

    return program
