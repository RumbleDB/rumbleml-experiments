# sklearn core
from pyspark.ml import Pipeline

# Preprocessing
from pyspark.ml.feature import StandardScaler, MaxAbsScaler, PCA, VectorAssembler, Imputer, OneHotEncoder

# Models
from pyspark.ml.regression import LinearRegression
from pyspark.ml.classification import LogisticRegression, RandomForestClassifier, LinearSVC, NaiveBayes, MultilayerPerceptronClassifier



def get_clf(mode, **kwargs):
    '''
    Code returning mllib classifier for pipelines
    '''
    if mode == 'logistic':
        max_iter = kwargs.get('max_iter', 5)
        model = LogisticRegression(featuresCol="transformed_features", maxIter=max_iter)
    elif mode=='RandomForest':
        n_estimators = kwargs.get('n_estimators', 5)
        model = RandomForestClassifier(featuresCol="transformed_features", numTrees=n_estimators)
    elif mode=='LinearSVC':
        max_iter = kwargs.get('max_iter', 5)
        model = LinearSVC(featuresCol="transformed_features", maxIter=max_iter)
    elif mode=='NB':
        model = NaiveBayes(featuresCol="transformed_features")
    elif mode=='linear':
        model = LinearRegression(featuresCol="transformed_features")
    elif 'NN' in mode:
        solver = kwargs.get('solver', 'sgd')
        hidden_layer_sizes = kwargs.get('hidden_layer_sizes', (20,))
        if isinstance(hidden_layer_sizes, list):
            hidden_layer_sizes = list(hidden_layer_sizes)
        activation = kwargs.get('activation', 'relu')
        learning_rate_init = kwargs.get('learning_rate', 0.001)
        max_iter = kwargs.get('max_iter', 5000)
        if mode=='NN':
            model = MultilayerPerceptronClassifier(solver=solver, layers=hidden_layer_sizes, stepSize=learning_rate_init,
                                maxIter=max_iter)
    return model

def get_pipe_ops(mode, inputCol="features", outputCol="transformed_features"):
    if mode == 'pipe_0':
        # just the classifier
        vecAssembler = VectorAssembler(outputCol=outputCol)
        vecAssembler.setInputCols([inputCol])
        ops = [vecAssembler] 

    elif mode == 'pipe_1':
        # 1-step scaler (*map)
        scaler = MaxAbsScaler(inputCol=inputCol, outputCol=outputCol)
        ops = [scaler]

    # elif mode == 'pipe_2':
        # 2-step function scaler (*map)
        # def logVar(x):
        #     return MaxAbsScaler(np.log(x))
        # ops = [('logscaler', FunctionTransformer(logVar))]

    elif mode == 'pipe_3':
        # dimensionality reduction (*map)
        pca = PCA(k=2, inputCol=inputCol, outputCol=outputCol)
        ops = [pca]

    # elif mode == 'pipe_4':
        # k-means (fork)
        # union = FeatureUnion([("indicator", MissingIndicator()),
        #                ("kmeans", KMeans(random_state=0))])
        # ops = [('union', union)]

    elif mode == 'pipe_5':
        # TODO
        # multiple dimensionality reductions (fork)
        pca = PCA(k=2, inputCol=inputCol, outputCol="pca_output")
        #svd = SVD()
        #lda = LDA()
        
        vecAssembler = VectorAssembler(outputCol=outputCol)
        vecAssembler.setInputCols(["pca_output"])

        ops = [pca, vecAssembler]

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

def create_numerical_pipeline(ops_mode, imputer=True, clf_mode='logistic', **kwargs):

    ops = get_pipe_ops(ops_mode)
    clf = get_clf(clf_mode, **kwargs)
    # vecAssembler = VectorAssembler(outputCol="data")
    # vecAssembler.setInputCols(["col_0", "col_1", "col_2", "col_3", "col_4", "col_5", "col_6", "col_7", "col_8", "col_9", "col_10", "col_11", "col_12", "col_13"])
    # ops = [vecAssembler] + ops
    if imputer:
        imp = Imputer(strategy='mean')
        ops = [imp] + ops
    ops = ops + [clf]
    pipe = Pipeline(stages=ops)
    return pipe

def create_tabular_pipeline(num_mode, outputCols="output", categorical_ix=["cat_features"], numerical_ix=["num_features"], imputer=True, clf_mode='logistic', **kwargs):

    num_ops = get_pipe_ops(num_mode, outputCols=outputCols)
    # imp = Imputer(strategy='categorical') - mllib doesn't support categorical input
    cat_one_hot = OneHotEncoder(inputCols=categorical_ix, outputCols="cat_features")
    ops = [cat_one_hot] + num_ops
    if imputer:
        num_imputer = Imputer(inputCols=numerical_ix, strategy='median', outputCols='data')
        ops = [num_imputer] + ops
    
    clf = get_clf(clf_mode)
    vecAssembler = VectorAssembler(outputCols=outputCols)
    vecAssembler.setInputCols(["cat_output"])
    ops = ops + [clf]
    pipe = Pipeline(stages=ops)
    return pipe