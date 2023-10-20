# Appendix A - Datasets {#appendixA-chapter3 .unnumbered}

| **Habitat States**                | **Description**                                                                                                                         |
|:----------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------|
| Branching coral                   | Branching coral of the Acroporidae familly                                                                                              |
| Brown algale                      | Brown foliose algae                                                                                                                     |
| Bushy Fucoid like                 | Bushy algae with a morphology similar to that of *Fucus spp.*                                                                           |
| Crustose coralline algae          | Crustose (nongeniculate) coralline algae forming a thin calcerous cruste                                                                |
| Crustose coralline algae and turf | Crustose (nongeniculate) coralline algae forming a thin calcerous cruste with turf algae (see below)                                    |
| Filamentous algae                 | Long filamentous epiphytic algae growing over large algae                                                                               |
| Green calcified algae             | Green calcified algae of the *Halimeda* genus with a green calcified thallus                                                            |
| Large canopy forming algae        | Large canopy forming algae as species of genus *Laminaria*, *Macrocystis*, *Sargassum*, *Durvillaea*, *Ecklonia* and others             | 
| Other Sessile invertebrates       | Other sessile invertebrates like mussel beds, oyster reefs                                                                              | 
| Red algae                         | Red foliose algale                                                                                                                      |
| Seagrass                          | Marine angiosperms of various famillies as Cymodoceaceae, Posidoniaceae, Potamogetonaceae, Ruppiaceae, Zannichelliaceae and Zosteraceae |
| Soft coral and gorgonians         | Soft coral and gorgonians                                                                                                               |
| Substrate                         | Substrate including bare substrate, sand and unconsolidate substrate                                                                    |
| Turf                              | Small algae (2cm < in hight) forming dense and tangled mats or carpets on marine substrates                                             |

Table: Habitat states identified in the Chapter 2 and their description included in this study. {#tbl:chap3tblS1}

![Occurrence of the different habitat states in the dataset](03-Chapitre3/figures/supplementary/06-occurence_habitat_dataset.png){#fig:chap3figS1}

![PCA biplots of the fishing data.](03-Chapitre3/figures/supplementary/05-pca_fishing.png){#fig:chap3figS2}

![Pearson’s correlation matrix of selected predictors.](03-Chapitre3/figures/supplementary/05c-corr_plot_all_vars.png){#fig:chap3figS3}

![a. Number of transect per spatial block. b. Map of the distribution of spatial blocks along the Australian coast. c. Map of spatial block allocation in one of the three folds.](03-Chapitre3/figures/supplementary/06-Spatial_fold_assignment.png){#fig:chap3figS4}

![Number of occurrences of each habitat state per training and test fold. The colour is based on the proportion represented by each habitat state within the considered fold.](03-Chapitre3/figures/supplementary/06-occurence_habitat_folds.png){#fig:chap3figS5}


# Appendix B - Model fitting & Evaluation {#appendixB-chapter3 .unnumbered}

## Model Fit {.unnumbered .unlisted}

### Hyperparameter tunning {.unnumbered .unlisted}

| **Hyperparameter name** | **Description**                                                                                                                      | **Values**                            |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
| *n_estimators*          | The number of trees in the forest.                                                                                                   | $\{100, 200, 300, \ldots, 3000\}$     |
| *max_features*          | The number of predictors to consider when looking for the best split.                                                                | $\{2, 3, 4, \ldots, 8\}$              |
| *max_depth*             | The maximum depth of each tree. If $\infty$, then nodes are expanded until all leaves are pure or contain less than 2 samples        | $\{5, 10, 15, \ldots, 100, \infty\}$  |


Table: Description of the hyperparameters tuned and their values according to the *scikit-learn* documentation. {#tbl:chap3tblS2}

### Confusion Matrix {.unnumbered .unlisted}

![Confusion Matrix of the explanatory power.](03-Chapitre3/figures/supplementary/03-confusion_matrix_train_all.png){#fig:chap3figS6}

### Probability distribution of habitat states {.unnumbered .unlisted}

![Distribution of occurrence probabilities for each habitat state. The dotted line represents the threshold optimised by MaxTSS to binarise the predictions.](03-Chapitre3/figures/supplementary/03-hab_probability.png){#fig:chap3figS7}

### AUC Curves {.unnumbered .unlisted}

![AUC curves of the explanatory power for the Branching coral.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Branching coral.png){#fig:chap3figS8}

![AUC curves of the explanatory power for the Brown algae.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Brown algae.png){#fig:chap3figS9}

![AUC curves of the explanatory power for the Bushy Fucoid like.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Bushy Fucoid like.png){#fig:chap3figS10}

![AUC curves of the explanatory power for the Crustose coralline algae and turf.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Crustose coralline algae and turf.png){#fig:chap3figS11}

![AUC curves of the explanatory power for the Crustose coralline algae.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Crustose coralline algae.png){#fig:chap3figS12}

![AUC curves of the explanatory power for the Filamentous algae.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Filamentous algae.png){#fig:chap3figS13}

![AUC curves of the explanatory power for the Green Calcified algae.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Green calcified algae.png){#fig:chap3figS14}

![AUC curves of the explanatory power for the Large canopy forming algae.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Large canopy forming algae.png){#fig:chap3figS15}

![AUC curves of the explanatory power for the Other Sessile invertebrates.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Other Sessile invertebrates.png){#fig:chap3figS16}

![AUC curves of the explanatory power for the Red algae.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Red algae.png){#fig:chap3figS17}

![AUC curves of the explanatory power for the Seagrass.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Seagrass.png){#fig:chap3figS18}

![AUC curves of the explanatory power for the Soft coral and gorgonians.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Soft coral, gorgonians.png){#fig:chap3figS19}

![AUC curves of the explanatory power for the Substrate.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Substrate.png){#fig:chap3figS20}

![AUC curves of the explanatory power for the Turf.](03-Chapitre3/figures/supplementary/03-receiver_operator_curve_train_rf_Turf.png){#fig:chap3figS21}

### AUPRC Curves {.unnumbered .unlisted}

![AUPRC curves of the explanatory power for the Branching coral. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Branching coral.png){#fig:chap3figS22}

![AUPRC curves of the explanatory power for the Brown algae. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Brown algae.png){#fig:chap3figS23}

![AUPRC curves of the explanatory power for the Bushy Fucoid like. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Bushy Fucoid like.png){#fig:chap3figS24}

![AUPRC curves of the explanatory power for the Crustose coralline algae and turf. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Crustose coralline algae and turf.png){#fig:chap3figS25}

![AUPRC curves of the explanatory power for the Crustose coralline algae. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Crustose coralline algae.png){#fig:chap3figS26}

![AUPRC curves of the explanatory power for the Filamentous algae. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Filamentous algae.png){#fig:chap3figS27}

![AUPRC curves of the explanatory power for the Green Calcified algae. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Green calcified algae.png){#fig:chap3figS28}

![AUPRC curves of the explanatory power for the Large canopy forming algae. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Large canopy forming algae.png){#fig:chap3figS29}

![AUPRC curves of the explanatory power for the Other Sessile invertebrates. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Other Sessile invertebrates.png){#fig:chap3figS30}

![AUPRC curves of the explanatory power for the Red algae. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Red algae.png){#fig:chap3figS31}

![AUPRC curves of the explanatory power for the Seagrass. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Seagrass.png){#fig:chap3figS32}

![AUPRC curves of the explanatory power for the Soft coral and gorgonians. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Soft coral, gorgonians.png){#fig:chap3figS33}

![AUPRC curves of the explanatory power for the Substrate.The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Substrate.png){#fig:chap3figS34}

![AUPRC curves of the explanatory power for the Turf. The grey lines represent isolines of F1-score.](03-Chapitre3/figures/supplementary/03-precision_recall_curve_train_rf_Turf.png){#fig:chap3figS35}

# Appendix C - Model Explanation {#appendixC-chapter3 .unnumbered}

![a. Bar plot of the three most important variables according to the SHAP framework for Branching coral habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Branching coral.png){#fig:chap3figS36}

![a. Bar plot of the three most important variables according to the SHAP framework for Brown algae habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Brown algae.png){#fig:chap3figS37}

![a. Bar plot of the three most important variables according to the SHAP framework for Bushy Fucoid like habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Bushy Fucoid like.png){#fig:chap3figS38}

![a. Bar plot of the three most important variables according to the SHAP framework for Bushy Fucoid like habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Bushy Fucoid like.png){#fig:chap3figS39}

![a. Bar plot of the three most important variables according to the SHAP framework for Crustose coralline algae and turf habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Crustose coralline algae and turf.png){#fig:chap3figS40}

![a. Bar plot of the three most important variables according to the SHAP framework for Crustose coralline algae habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Crustose coralline algae.png){#fig:chap3figS41}

![a. Bar plot of the three most important variables according to the SHAP framework for Filamentous algae habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Filamentous algae.png){#fig:chap3figS42}

![a. Bar plot of the three most important variables according to the SHAP framework for Green calcified algae habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Green calcified algae.png){#fig:chap3figS43}

![a. Bar plot of the three most important variables according to the SHAP framework for Large canopy forming algae habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Large canopy forming algae.png){#fig:chap3figS44}

![a. Bar plot of the three most important variables according to the SHAP framework for Other Sessile invertebrates habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Other Sessile invertebrates.png){#fig:chap3figS45}

![a. Bar plot of the three most important variables according to the SHAP framework for Red algae habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Red algae.png){#fig:chap3figS46}

![a. Bar plot of the three most important variables according to the SHAP framework for Seagrass habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Seagrass.png){#fig:chap3figS47}

![a. Bar plot of the three most important variables according to the SHAP framework for Soft coral and gorgonians habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Soft coral, gorgonians.png){#fig:chap3figS48}

![a. Bar plot of the three most important variables according to the SHAP framework for Substrate habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Substrate.png){#fig:chap3figS49}

![a. Bar plot of the three most important variables according to the SHAP framework for Turf habitat state. The bars are coloured according to the type of pressure. b. to d. Partial Dependence plot of these three most important variables.](03-Chapitre3/figures/supplementary/04-pdp_Turf.png){#fig:chap3figS50}