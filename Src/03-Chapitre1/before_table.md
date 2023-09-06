# Essential ingredients in Joint Species Distribution Models

## Abstract {#abstract-chapter1}

1.	Joint Species Distribution Models (jSDM) are increasingly used to explain and predict biodiversity patterns. jSDMs account for species co-occurrence patterns and can include phylogeny or functional traits to better capture the processes shaping communities. Yet, several factors may alter the interpretability and predictive ability of jSDMs : missing abiotic predictors, omitting ecologically-important species, or increasing the number of model parameters by adding phylogeny and/or trait information.

2.	We developed a novel framework to comprehensively assess the interpretability, explanatory and predictive power of jSDMs at both species and community levels. We compared performances of four alternative model formulations : (1) a benchmark jSDM with only abiotic predictors and residual co-occurrence patterns, (2) a jSDM adding phylogeny to the benchmark, (3) a jSDM adding traits to model 2, and (4) the benchmark jSDM with additional non-target species that are not of direct interest but potentially interact with the target assemblage. Models were fitted on both presence/absence and abundance data for 99 target polychaete species sampled in two coastal habitats over 500km and 8 years, along with information on 179 non-target species and traits data for the target species.

3.	For both presence/absence and abundance data, explanatory power was good for all models but their interpretability and predictive power varied. Relative to the benchmark model, predictive errors on species abundances decreased by 95% or 53%, when including non-target species, or phylogeny, respectively. These differences across models relate to changes in both species-environment relationships and residual co-occurrence patterns. While considering trait data did not improve explanatory or predictive power, it facilitated interpretation of trait-mediated species response to environmental gradients.

4.	This study demonstrates that any jSDM formulation comes with tradeoffs between either explaining or predicting the occurrence or abundance of species. Hence, it highlights the need to compare alternative model formulations using the original and comprehensive assessment framework proposed in this study. Overall, this work contributes to a better understanding of jSDMs’ performances across multiple facets and provides insights and tools for model selection based on specific objectives and available data.

## Introduction {#introduction-chapter1}

Community ecology aims at describing, explaining, and predicting changes in communities [@Tredennick_2021]. Understanding the processes that determine species distribution is a prerequisite to characterize and predict community structure and associated ecological dynamics, which is critical to inform effective management or restoration measures in a rapidly changing world [@Dietze_2018 ; @Brudvig_2022]. Joint Species Distribution Models (jSDM) are particularly well-suited tools to address these challenges, whether to characterize the processes that shape observed communities [@Warton_2015 ; @Ovaskainen_2017b], or to predict future changes in species assemblages [@Norberg_2019 ; @Pollock_2020].

jSDMs are multivariate (i.e. multi-species) extensions of Species Distribution Models (SDMs), which have been broadly applied over the past decades - across all terrestrial and marine realms - to understand and predict both species occurrences [@Elith_2006 ; @Norberg_2019] and species abundances [@Howard_2014 ; @Waldock_2022] using a set of covariates (e.g. climatic variables). Relative to SDMs, jSDMs explanatory power can benefit from accounting for species assembly rules [@Ovaskainen_2017a]. In particular, relative to single-species SDMs that only consider the abiotic niche of species (i.e. the Grinellian niche), jSDM can theoretically also account for interspecific interactions (i.e. the Eltonian niche).

In jSDMs, the variability in community composition not explained by covariates is captured by a residual covariance matrix representing species co-occurrence patterns potentially representing biotic interactions [@Ovaskainen_2017a]. This feature is highly attractive to ecologists because it provides a way to disentangle the relative influence of abiotic and biotic processes on biodiversity patterns [@Godsoe_2017] while also improving model’s predictive power [@Giannini_2013 ; @Staniczenko_2017]. However, in practice, inferring and interpreting residual co-occurrence patterns using jSDMs remains challenging for several reasons [@Blanchet_2020 ; @Holt_2020].

First, while jSDMs have been applied to a large number of species presence/absence datasets [@Norberg_2019 ; @Wilkinson_2019 ; @Wilkinson_2020], simulation studies showed that inferred co-occurrence networks do not necessarily provide evidence for species interactions [@Dormann_2018 ; @Blanchet_2020] but only capture spatial and temporal associations between species [@Keil_2021]. Some authors speculated that jSDMs applied to abundance data - instead of presence/absence data - could provide a better proxy for biotic interactions [@Blanchet_2020 ; @Momal_2020]. Accordingly, jSDM have increasingly been applied to abundance data [@Hui_2016 ; @Ovaskainen_2017a ; @Chiquet_2021]. While challenges related to modelling abundance data was recently explored in the context of species distribution modelling [@Waldock_2022], the predictive and the explanatory power of jSDM fitted to abundance data remains relatively untested compared to presence/absence data [@Norberg_2019 ; @Wilkinson_2020].

Second, regardless of the type of data considered (i.e. presence/absence or abundance), several factors may limit or affect the interpretability and predictive ability of jSDM. For instance, co-occurrence patterns estimated in jSDM are affected by unaccounted environmental variables implying that jSDMs cannot fully separate the environmental and the biotic niche of species [@Blanchet_2020 ; @Poggiato_2021]. Beyond missing environmental predictors, accounting for extra species that can influence the target community (e.g. competitors) is key to improve jSDMs’ inference and predictions. However, because many ecological studies only focus on particular taxonomic groups [@Pollock_2014 ; @Hakkila_2018] and disregard non-target taxa, co-occurrence patterns estimated from jSDMs are almost always skewed by missing ecological actors [@Momal_2021]. How this bias affects the predictive ability of jSDM remains untested.

Finally, similar to SDMs, jSDMs can theoretically be extended to include additional sources of information about modelled species [@Niku_2019 ; @Ovaskainen_2017a]. For instance, accounting for phylogenetic relationships between species [@Ives_2011] or for the link between functional traits and environmental responses [@Pollock_2012] can improve both the explanatory and the predictive powers of SDMs [@Morales-Castilla_2017] ; @Vesk_2021]. These findings support the hypothesis that similar species, in terms of traits and/or recent evolutionary history, usually share similar environmental preferences. While inclusion of species-specific information in jSDMs should yield similar benefits [@Ovaskainen_2017a], the relative influence of additional sources of information on their interpretability and predictive power remains untested [@Norberg_2019 ; @Wilkinson_2019 ; @Abrego_2022].

Overall, many practical questions remain concerning the application of jSDMs to ecological community monitoring data, in particular related to inclusion of additional sources of information within the models. While some comparative assessments of jSDM performance exists (e.g. @Norberg_2019 ; @Wilkinson_2020), including some comparison of the benefit of trait and phylogenetic data in some phyla (e.g. @Abrego_2022), there has been no formal assessment of the relative importance of species-specific information (trait and/or phylogeny) compared to the role of missing species. Furthermore, comparative assessments have rarely been performed on both presence/absence and abundance data. To a few exceptions [@Waldock_2022], most assessments were made considering presence/absence data [@Norberg_2019 ; @Wilkinson_2019] and mostly focused on predictive power [@Norberg_2019 ; @Wilkinson_2019], hence disregarding the interpretability/explanatory aspects of the models [@Tredennick_2021]. Yet, jSDMs are increasingly fitted on abundance data [@Brimacombe_2020] and used for explanatory purposes [@Abrego_2016]. Hence, there is a mismatch between current understanding of jSDMs performance and their application by ecologists. In practice, most jSDM applications consider a single model structure and do not explore the effects of including additional sources of information. Perhaps this shortcoming relates to the high-dimensionality of jSDMs which makes their comparison challenging.

In this study, we developed a multi-faceted assessment framework to evaluate the extent to which alternative parameterization of jSDM can lead to a better interpretability or predictability at the species and community levels. To illustrate its usefulness, we applied this general framework to a case study presenting typical features of community ecology datasets. Specifically, by comparing predictions obtained from a benchmark model excluding additional sources of information (i.e. a classical jSDM), we tested the effect of (1) including phylogeny alone and in combination with trait data, (2) incorporating monitoring information related to non-target species and (3) considering abundance instead of presence/absence data. We hypothesized that all these sources of information should improve jSDM predictive and explanatory powers, but did not assume a priori that a given modeling strategy would lead to greater improvements in model performances.

Community ecology aims at explaining and predicting spatio-temporal variability in species diversity [@Whittaker_2001] and coexistence [@Chesson_2000]. Understanding the processes that determine species distribution around the planet is a prerequisite to characterise and predict community structure and associated ecological dynamics, which is critical to mitigate the effects of global change on biodiversity and prevent the sixth mass extinction. Currently, the major challenges faced by ecologists include describing, explaining, and predicting changes in communities [@Tredennick_2021] in order to inform effective management or restoration measures in a rapidly changing world [@Dietze_2018 ; @Brudvig_2022]. Joint Species Distribution Models (jSDM) are particularly well-suited tools to address these challenges, whether to characterise the processes that shape observed communities [@Warton_2015 ; @Ovaskainen_2017a], or to predict how communities will evolve in the future [@Norberg_2019 ; @Pollock_2020].

jSDMs are multivariate (i.e. multi-species) extensions of Species Distribution Models (SDMs), which have been broadly applied over the past decades - across all terrestrial and marine realms - to understand and predict both species occurrences [@Elith_2006 ; @Norberg_2019] and species abundances [@Howard_2014 ; @Waldock_2022] using a set of covariates (e.g. climatic variables). One potential advantage of jSDM over SDMs lies in their explanatory power owing to their tight link with the assembly rule framework [@Ovaskainen_2017a]. In particular, relative to single-species SDMs that only consider the abiotic niche of species (i.e. the Grinellian niche), jSDM can theoretically also account for interspecific interactions (i.e. the Eltonian niche).

In jSDMs, the variability in community composition not explained by covariates is captured by a residual covariance matrix representing species co-occurence patterns potentially representing biotic interactions [@Ovaskainen_2017a]. This feature is highly attractive to ecologists because it provides a way to disentangle the relative influence of abiotic and biotic processes on biodiversity patterns [@Godsoe_2017] while also improving model’s predictive power [@Giannini_2013 ; @Staniczenko_2017]. However, in practice, inferring and interpreting residual co-occurence patterns using jSDMs remains challenging for several reasons [@Blanchet_2020 ; @Holt_2020].

First, while jSDMs have been applied to a large number of species presence/absence datasets [@Norberg_2019 ; @Wilkinson_2019 ; @Wilkinson_2020], simulation studies showed that co-occurence networks inferred from such data do not necessarily provide evidence for species interactions [@Dormann_2018 ; @Blanchet_2020] but only inform about spatial and temporal associations between species [@Keil_2021]. Some authors speculated that jSDMs applied to abundance data - instead of presence/absence data - could provide a better proxy for biotic interactions [@Blanchet_2020 ; @Momal_2020]. Accordingly, jSDM have progressively been extended and applied to abundance data [@Hui_2016 ; @Ovaskainen_2017a ; @Chiquet_2021]. Yet, specific challenges related to modelling abundance data have only been recently explored in the context of species distribution modelling [@Waldock_2022]. To date, the predictive and the explanatory power of jSDM fitted to abundance data remains relatively untested compared to presence/absence data [@Norberg_2019 ; @Wilkinson_2020].

Second, regardless of the type of data considered (i.e. presence/absence or abundance), several factors may limit or affect the interpretability and predictive ability of jSDM. For instance, co-occurence patterns estimated in jSDM are affected by unaccounted environmental variables implying that jSDMs cannot fully separate the environmental and the biotic niche of species [@Blanchet_2020 ; @Poggiato_2021]. Beyond missing environmental predictors, one prerequisite for improving biotic inference and thus jSDMs’ predictions is to account for other actors (i.e. species) that could have an influence on the target community (e.g. competitors). However, because many ecological studies only focus on particular taxonomic groups [@Pollock_2014 ; @Hakkila_2018], hence disregarding non-target taxa, co-occurence patterns estimated from jSDMs are almost always skewed by missing ecological actors [@Momal_2021]. How this bias affects the predictive ability of jSDM remains untested.

Finally, similarly to SDMs, jSDMs can theoretically be extended to include additional sources of information about modelled species [@Niku_2019 ; @Oberpriller_2021a]. For instance, accounting for phylogenetic relationships between species [@Ives_2011] or for the link between functional traits and environmental responses [@Pollock_2012] have been shown to improve both the explanatory and the predictive powers of SDMs [@Morales-Castilla_2017 ; @Vesk_2021], which supports the hypothesis that similar species, in terms of traits and/or recent evolutionary history, usually have similar environmental preferences. While similar effects related to inclusion of species-specific information are expected in jSDMs [@Ovaskainen_2017a], the relative influence of additional sources of information on their interpretability and predictive power remains untested [@Norberg_2019 ; @Wilkinson_2019 ; @Abrego_2022].

Overall, many practical questions remain concerning the application of jSDMs to ecological community monitoring data in particular related to inclusion of additional sources of information within the models. While some comparative assessments of jSDM performance exists (e.g. @Norberg_2019, @Wilkinson_2020), including some comparison of the benefit of trait and phylogenetic data in some phyla (e.g. @Abrego_2022), there has been no formal assessment of the relative importance of species-specific information (trait and/or phylogeny) compared to the role of missing species. Furthermore, comparative assessments have rarely been performed on both presence/absence and abundance data. To a few exceptions [@Waldock_2022], most assessments were made considering presence/absence data [@Norberg_2019 ; @Wilkinson_2019] and mostly focused on predictive power [@Norberg_2019 ; @Wilkinson_2019], hence disregarding the interpretability/explanatory aspects of the models [@Tredennick_2021]. Yet, jSDMs are increasingly fitted on abundance data [@Brimacombe_2020] and used for explanatory purposes [@Abrego_2016]. Hence, there is a mismatch between current understanding of jSDMs performance and their application by ecologists. In practice, most jSDM applications consider a single model structure and do not explore the effects of including additional sources of information. Perhaps this shortcoming relates to the high-dimensionality of jSDMs which makes their comparison challenging.

### Materials \& Methods {#materials-methods-chapter1}

We used the HMSC (Hierarchical Modeling of Species Communities) framework applied to a long-term monitoring dataset. The following subsections sequentially describe our workflow (as illustrated in Fig. 1): (1) the HMSC framework, (2) the data used in this study, (3) data splitting between train and test datasets to assess the explanatory and predictive powers of models, respectively, (4) the rationales for the suite of alternative models considered and, (5) a multi-faceted framework developed to assess tradeoffs in jSDMs’ performances in relation to different study purposes.

### Hierarchical Modelling of Species Community (HMSC)

HMSC is a multivariate hierarchical generalized linear mixed model using Bayesian inference (Ovaskainen & Abrego 2020). It has two parts: one for fixed effects and another for random effects. The fixed part models the species’ realized niche, where each dimension of the niche is a covariate (e.g. temperature; Fig. 1). Including trait data can improve species niche estimates by accounting for trait-environment relationships, where species with similar traits are expected to respond similarly along environmental gradients (Ovaskainen et al. 2017b). Including phylogenetic data can help capture residual ecological information not included in the available trait data, as phylogenetically-close species tend to share similar traits and niches (Wiens et al. 2010). Alongside traits, phylogeny can improve niche estimates for rare species by borrowing information from similar species (Ovaskainen & Abrego, 2020). The random part of HMSC relies on latent variables, i.e. covariates that capture residual variance, including missing environmental features or biotic interactions (Ovaskainen et al. 2017a ; Ovaskainen et al. 2017b ; Ovaskainen & Abrego 2020). The H matrix (site loadings) estimates missing covariate values, while the Λ matrix (species loadings) represents species’ response to these missing covariates (Fig. 1). 

HMSC is a multivariate hierarchical generalised linear mixed model using Bayesian inference [@Ovaskainen_2020]. It has two parts: one for fixed effects and another for random effects. The fixed part models the species’ realized niche, where each dimension of the niche is a covariate (e.g. temperature; +@fig:workflow). Including trait data can improve species niche estimates by accounting for trait-environment relationships, where species with similar traits are expected to respond similarly along environmental gradients [@Ovaskainen_2017a]. Including phylogenetic data can help capture residual ecological information not included in the available trait data, as phylogenetically-close species tend to share similar traits and niches [@Wiens_2010]. Alongside traits, phylogeny can improve niche estimates for rare species by borrowing information from similar species [@Ovaskainen_2020]. The random part of HMSC relies on latent variables, i.e. covariates that capture residual variance, including missing environmental features or biotic interactions [@Ovaskainen_2017b ; @Ovaskainen_2017a ; @Ovaskainen_2020]. The H matrix (site loadings) estimates missing covariate values, while the $$\Lambda$$ matrix (species loadings) represents species’ response to these missing covariates @fig:workflow. 

<!-- ![Study workflow. A. Hierarchical Model of Species Community (HMSC) structure, incorporating environmental variables, phylogeny, and species-specific traits. B. Data pre-processing: partitioning community data into train and test datasets, estimating phylogenetic distance (using taxonomic classification), and dimension reduction of species-trait matrix using fuzzy-PCA. C. Summary of the four alternative model structures fitted to presence/absence and abundance data: the Benchmark, Phylogeny, Traits & Phylogeny models only consider the targeted polychaetes, while the Whole Community model includes additional species potentially interacting with the target assemblage. Random effects for sampling year, site, and habitat were included in all models.](figures/fig1.png){#fig:workflow} -->

### Datasets

#### Faunistic data

The REBENT program (rebent.ifremer.fr) is an ongoing monitoring of benthic macrofauna across multiple stations along Brittany’s coastline (Western France). Here, we used data from Boyé et al. (2019), covering 23 sites and two intertidal soft-bottom habitats: bare sands and seagrass meadows (Fig. S1) where infaunal communities were monitored yearly using the same protocol between 2006 and 2014. A detailed description of the sampling methodology is provided in (Boyé et al. 2017 ; Boyé et al. 2019). At each site, three faunal samples (0.03 m2 cores) were taken at each of three fixed sampling points distributed 200 m apart. These samples were then pooled together to estimate abundances at the site level. For each sampling event, individuals were identified to the lowest taxonomic level possible (mostly species level; for simplicity we hereafter refer to “species”).

Overall, across a total of 375 sampling units (i.e. unique combination of years, sites and habitats), 152,583 individuals belonging to 519 species were collected and identified. To avoid convergence issues and poor model inference, we filtered out species occurring less than four times (across the 180 samples used as train set, see below), resulting in the removal of 241 species. The remaining 278 species included 99 polychaete species (the targeted assemblage) and 179 non-target species of bivalves, molluscs, and amphipoda, which may predate or compete with polychaetes (Grall et al. 2006 ; Jankowska et al. 2019). We chose to focus on polychaetes as this taxonomic group exhibits diverse lifestyles (Jumars et al. 2015), can be used to monitor the health of benthic habitats (Giangrande et al. 2005), and because trait data and ecological information were available from previous studies (Boyé et al. 2019).


The REBENT program ([rebent.ifremer.fr](https://rebent.ifremer.fr)) is an ongoing monitoring of benthic macrofauna across multiple stations along Brittany’s coastline (Western France). Here, we used data from @Boye_2019a, covering 23 sites and two intertidal soft-bottom habitats: bare sands and seagrass meadows (Fig. S1) where infaunal communities were monitored yearly using the same protocol between 2006 and 2014. A detailed description of the sampling methodology is provided in [@Boye_2017 ; @Boye_2019a]. At each site, three sediment cores of 0.03m$$^2$$ were sampled and pooled together. For each sampling event, individuals were identified to the lowest taxonomic level possible (mostly species level; for simplicity we hereafter use the term “species”).

Overall, across a total of 375 sampling units (i.e. unique combination of years, sites and habitats), 152,583 individuals belonging to 519 species were collected and identified. To avoid convergence issues and poor model inference, we filtered out species occurring less than four times (across the 180 samples used as train set, see below), resulting in the removal of 241 species. The remaining 278 species included 99 polychaete species (our study target) and 179 non-target species, such as bivalves, molluscs, and amphipoda, which may act as predators or competitors for polychaetes [@Grall_2006 ; @Jankowska_2019]. We chose to focus on polychaetes as this taxonomic group exhibits diverse lifestyles [@Jumars_2015], can be used to monitor the health of benthic habitats [@Giangrande_2005], and because trait data and ecological information were available from previous studies @Boye_2019a .

#### Traits and phylogeny data

Traits data were retrieved from [@Boye_2019a] for the 99 polychaete species present in the train set (see below). The 11 fuzzy-coded traits available (see @Boye_2019a for details) were synthetized using a fuzzy-PCA, with the fpca function from the ade4 R package [@Thioulouse_2018]. The first three axes, which account for 59% of the total variance of the trait matrix, were included in the model as synthetic traits data (Fig. 1). The first axis distinguishes mobile predatory species from sessile microphages; the second axis differentiates semelparous species from iteroparous species; and, the third axis separates burrowers from tube-dwellers (Fig. S2).

Phylogeny was not available, hence we followed common practices (Ovaskainen and Abrego 2020) and retrieved the taxonomic classification of these 99 polychaetes through the WoRMS database (www.marinespecies.org; january 2020) and used this information as a proxy for phylogenetic relationships (Fig. 1 ; @Ovaskainen_2020). Phylogenetic distances were then estimated using the ape R package (Paradis & Schliep 2019).

Traits data were retrieved from @Boye_2019a for the 99 polychaete species present in the train set (see below). It consisted in information on 11 fuzzy-coded traits (see @Boye_2019a for details) that were here synthetized using a fuzzy-PCA, with the fpca function from the ade4 R package [@Thioulouse_2018]. The first three axes, which account for 59% of the total variance of the trait matrix, were included in the model as synthetic traits data (Fig. 1). The first axis distinguishes mobile predatory species from sessile microphages; the second axis differentiates semelparous species from iteroparous species; and, the third axis separates burrowers from tube-dwellers (Fig. S2). We also retrieved the taxonomic classification of these 99 polychaetes through the WoRMS database ([www.marinespecies.org](https://www.marinespecies.org); january 2020) and used this information as a proxy for phylogenetic relationships (Fig. 1 ; @Ovaskainen_2020). Phylogenetic distances were then estimated using the ape R package [@Paradis_2019].

#### Environmental data

Following @Boye_2019a (see appendix A for details about data sources), we selected seven environmental variables to characterise the ecological niche of each species. These seven variables quantify different components of coastal environmental variability including hydrology (sea water temperature, salinity and current velocity), sedimentology (mud and organic matter content), substrate heterogeneity (Trask index) and local wave exposure (fetch). For each of these seven variables, the first- and second-degree polynomials were computed to account for non-linear responses.

### Comparison of alternative model structures

The first model (denoted Bench) only considers data for the 99 target polychaete species and the 7 environmental covariates (Fig. 1). The second model (denoted Ph) adds phylogenetic data to the Bench model (Fig. 1). The third model (denoted TrPh) adds traits data to the Ph model. The fourth model (denoted WhC) has the same structure as the Bench model but includes data on the whole community (278 species, including 179 additional non-target species; Fig. 1). WhC excludes traits (unavailable for the non-target taxa) and phylogenetic data for faster computation. Each model was fitted twice, either with presence/absence or abundance data, using probit and lognormal Poisson distributions respectively. All models include the same random effects (Fig. 1): temporal, spatial (sites), and habitats (bare vs seagrass).

The first model (denoted Bench) only considers data for the 99 target polychaete species and the 7 environmental covariates (+@fig:workflow). The second model (denoted Ph) adds phylogenetic data to the Bench model (+@fig:workflow). The third model (denoted TrPh) adds traits data to the Ph model. The fourth model (denoted WhC) has the same structure as the Bench model but includes data on the whole community (278 species, including 179 additional non-target species; +@fig:workflow). WhC excludes traits (unavailable for the non-target taxa) and phylogenetic data for faster computation. Each model was fitted twice, either with presence/absence or abundance data, using probit and lognormal Poisson distributions respectively. All models include the same random effects (+@fig:workflow): temporal, spatial (sites), and habitats (bare vs seagrass).

### Model fitting

We estimated model parameters by running 5 chains using a MCMC sampling algorithm over 375,000 iterations. The first 125,000 iterations were discarded as burn-in while the remaining were thinned every 250 iterations yielding 1,000 posterior samples per chain for an overall total of 5,000 posterior samples for each parameter. We assessed convergence for each model parameter using both potential scale reduction factor [@Gelman_1992] and effective sample size as reported in supplementary materials (Appendix B). All models were fitted using the DATARMOR supercomputing facility.

### Assessing model performance and interpretability

For independent assessment of models’ predictive performance, the dataset was split into a train and a test set, instead of using strict cross-validation procedure that would have considerably increase the computational burden (see also Norberg et al., 2019). The train dataset consisted of 180 sampling units (21 sites; one or two habitats, and six to nine years per site; Fig. S1). The test set comprised 35 sampling units covering a 9-year period at two specific sites with both seagrass and bare sand habitats. These sites were chosen as representative of both regional macrofaunal species diversity (all the species observed in the test set are also observed in the train set) and mean environmental conditions (which limits model extrapolation outside of the trained parameter space; Fig. S3-S4; @Boye_2017 ; @Boye_2022 ; @Toumi_2023).

To assess jSDM’s performance, we used a set of complementary metrics to evaluate both their explanatory and predictive abilities on the train and test dataset, respectively (Table 1). AUC and RMSE, calculated only for the 99 target species (i.e. polychaetes) even for the WhC model that includes a total of 278 species, were used to assess overall and species-level performance for presence/absence and abundance models, respectively. Relationships between observed and predicted mean species abundances across all sites were also visualized for abundance models.Along with the raw AUC and RMSE values, we also visualized and quantified changes relative to the Bench model for the Tr, TrPh and WhC models. For abundance models, we computed the overall relative change in mean RMSE across species as:

We also calculated the number of species for which performance improved (lower RMSE) or decreased (higher RMSE) relative to the Bench model. For the WhC model, which showed improved predictive power (see results), we further explored the relationships between the improvement in species-level RMSE (i.e. relative change computed relative to the Bench) and (1) species-wise prevalence and (2) average abundance across sampling observations using the Kendall rank correlation coefficient. 
AUC and RMSE only partially capture model accuracy at the community scale (Table 1). To explore this aspect, we focused on differences between predicted and observed assemblage richness and total abundances (for abundance models).  We also compared observed and predicted Sørensen (for presence/absence) and Bray-Curtis (abundance) pairwise-dissimilarity matrices to explore how well β diversity patterns were reproduced by the models. For these three metrics, we computed relative change for both the train and test datasets between mean predicted and mean observed values as follows:

where “Metric” is a community-based measure (e.g. species richness, total abundance, dissimilarity matrices) estimated from model predictions or observations at the sample level (i.e. unique combination of site, habitat and year; or, pairs of samples for dissimilarity). To evaluate model interpretability, we calculated the amount of explained variance per species and the proportion that can be attributed to environmental covariates (fixed effects) and random effects. We compared the overall relative change in the proportion of variance explained by the covariates and by the random effects for the Tr, TrPh and WhC relative to the Bench model (by comparing mean values across species similarly to Eq. (1)). We also propose a novel way of exploring species-environment relationships (Table 1) by classifying the response curves estimated from the different models based on their shapes, considering both their direction (decline, null, or increase) and their acceleration (decelerated, constant, or accelerated) [@Rigal_2020]. Finally, we compared the residual co-occurrence patterns associated with each random effect of the Bench model with those of the best performing model (WhC). We quantified differences in magnitude and sign of residual species-species correlations using the following index:

For independent assessment of models' predictive performance and computational efficiency, the dataset was split into a training set and a test set instead of using cross-validation. The training set consisted of 180 sampling units, combining years (ranging from six to nine depending on sites), sites (21), and two habitats (Fig. S1). From the original dataset with 519 species, we removed species occurring less than four times across the 180 units to avoid convergence issues and poor model inference, resulting in the removal of 241 species. The remaining 278 species included the 99 polychaete species (target community) and 179 non-target species (included in WhC model), such as bivalves, molluscs, and amphipoda, which may act as predators or competitors for polychaetes [@Grall_2006 ; @Jankowska_2019]. The test set comprised 35 sampling units covering a 9-year period at two specific sites with both seagrass and bare sand habitats. These sites were chosen as representative of the region's diversity gradient while having average environmental conditions to limit model extrapolation [@Boye_2017 ; @Boye_2022 ; @Toumi_2023].

To assess jSDM's performance, we used various metrics to evaluate explanatory (train dataset) and predictive (test dataset) abilities (+@tbl:tbl1; @Wilkinson_2020). AUC and RMSE were used for overall and individual species evaluation, respectively, for presence/absence and abundance models, focusing on target species (+@tbl:tbl1). For the WhC model, which showed improved predictive power, we examined species-specific explanatory power by correlating RMSE with the proportion of presences and average abundance using the Kendall rank correlation coefficient. While AUC and RMSE provide performance estimates at the species level, they only partially capture accuracy at the community scale (+@tbl:tbl1). Hence, we explored differences in predicted and observed community composition (train and test datasets) using Sørensen or Bray-Curtis dissimilarity for beta diversity comparisons. We also examined predicted richness differences among models (train and test datasets) and compared predicted abundances with observed abundances for abundance models.

To evaluate model interpretability, we calculated the proportion of explained variance attributed to environmental covariates (fixed effects) and random effects. We classified estimated response curves from different models into nine categories representing direction (decline, null, or increase) and acceleration (decelerated, constant, or accelerated) [@Rigal_2020] to assess species-environment relationship differences among models. Finally, to compare random effects across models, we measured differences between the Bench model and the best performing model in terms of residual co-occurrence patterns for target species. We quantified differences in magnitude and sign of residual species-species correlations using an index.

$$\text{Index} = |corr_{\text{best model}} - corr_{\text{benchmark}}| \times sign(corr_{\text{best model}} \times corr_{\text{benchmark}})$$