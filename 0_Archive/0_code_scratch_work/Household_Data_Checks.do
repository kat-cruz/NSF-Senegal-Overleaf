*** DISES Baseline Data Checks - Household Survey***
*** File Created By: Molly Doruska ***
*** File Last Updated By: Kateri Mouawad ***
*** File Last Updated On: January 31, 2024 ***

*** NOT working here LOL
// clear all 

*** set maximum variables to at least 20,000 ***
set maxvar 20000

**** Master file path – this is the only file path you should change ****
global master "C:\Users\km978\Box\NSF Senegal\Baseline Data Collection"

*** data folder *** 
global data "$master\Surveys\Baseline CRDES data (Jan-Feb2024)" 


*** Import data - update this every new data cleaning session ***
import delimited "$data\DISES_enquete_ménage_FINALE_WIDE_29Jan2024.csv", clear varnames(1) bindquote(strict)

*** import community survey data ***
*** this imports test data, update with acutal survey data ***
*use "C:\Users\socrm\Box\NSF Senegal\Baseline Data Collection\Surveys\Baseline CRDES data (Jan-Feb 2024)\DISES_enquete_ménage_FINALE.dta", clear 

*** label variables - location and respondent ***
label variable village_select "Selectionnez le vilalge pour le questionnaire menage"
label variable village_select_o "Nom du village"
label variable hhid_village "Village ID"
label variable consent "Acceptez-vous de faire l'interview et de participier a l'etude"
label variable hh_numero "Nombre de membres dans le menage"
label variable hh_phone "Numero de telephone du menage (ou numero de telephone d'un membre du menage)"
label variable hh_head_name_complet "Nom et prenom du chef du menage"
label variable hh_name_complet_resp "Nom et prenom du repondant"
label variable hh_age_resp "Age du repondant"
label variable hh_gender_resp "Sexe du repondant"
label variable hh_date "Date"
label variable hh_time "Heure"

*** labels for household members - loop through all member numbers ***
*** check the data to ensure this is the maximum number of members in a household ***
forvalues i = 1/28{
	label variable hh_first_name_`i' "Prenom"
	label variable hh_name_`i' "Nom"
	label variable hh_surname_`i' "Surnom"
	label variable hh_full_name_calc_`i' "Full Name"
	label variable hh_gender_`i' "Genre"
	label variable hh_age_`i' "Age"
	label variable hh_ethnicity_`i' "Ethnicite"
	label variable hh_ethnicity_o_`i' "Autre ethnie"
	label variable hh_relation_with_`i' "Relation avec le chef du menage"
	label variable hh_relation_with_o_`i' "Autre forme de relation"
	label variable hh_education_skills_`i' "Education - Competences (chiox multiple)"
	label variable hh_education_skills_0_`i' "Education - Competences - 0 Aucun"
	label variable hh_education_skills_1_`i' "Education - Competences - 1 Peut ecrire une courte letter a sa famille"
	label variable hh_education_skills_2_`i' "Education - Competences - 2 A l'aise avec les chiffres et les calculs"
	label variable hh_education_skills_3_`i' "Education - Competences - 3 Arabisant/peut lire le Coran en arabe"
	label variable hh_education_skills_4_`i' "Education - Competences - 4 Parle couramment le wolof/pulaar"
	label variable hh_education_skills_5_`i' "Education - Competences - 5 Peut lire un journal en francais"
	label variable hh_education_level_`i' "Niveau d'education atteint"
	label variable hh_education_level_o_`i' "Autre niveau"
	label variable hh_education_year_achieve_`i' "Combien d'annees d'etudes [hh_full_name_calc] a-t-il(elle) acheve(e)"
	label variable hh_main_activity_`i' "Activite principale en dehors de la maison"
	label variable hh_main_activity_o_`i' "Autre activite"
	label variable hh_mother_live_`i' "La mere de [hh_full_name_calc] vivait-elle dans le village le jour de la naissance de [hh_full_name_calc]"
	label variable hh_relation_imam_`i' "Lien de parente de [hh_full_name_calc] avec l'Imam ou le Chef du village"
	label variable hh_presence_winter_`i' "Presence en hiver/saison des pluies"
	label variable hh_presence_dry_`i' "Presence en saison seche"
	label variable hh_active_agri_`i' "Est-il/elle un travailleur agricle actif"
	label variable hh_01_`i' "Au cours des 7 derniers jours combien d'heurs [hh_full_name_calc] a consacre aux taches menageres ou a la preparation des repas"
	label variable hh_02_`i' "Au cours des 7 derniers jours combien d'heurs [hh_full_name_calc] a consacre pour chercher de l'eau"
	label variable hh_03_`i' "Au cours des 12 derniers mois, [hh_full_name_calc] a-t-il travaille dans le cadre d'activites agricoles domestiques"
	label variable hh_04_`i' "Au cours des 7 derniers jours, combien d'heures [hh_full_name_calc] a-t-il travaille dans le cadre d'activites agricoles domestiques"
	label variable hh_05_`i' "Pendant la periode de plantation de la derniere campagne agricole, combien d'heures"
	label variable hh_06_`i' "Pendant la periode de croissance maximale de la dernière campagne agricole, combien d'heures"
	label variable hh_07_`i' "Pendant la période de recolte de la dernière campagne agricole, combien de jours"
	label variable hh_08_`i' "Au cours des 7 derniers jours, combien d'heures [hh_full_name_calc] a t-il consacre pour travailler dans un commerce"
	label variable hh_09_`i' "Au cours des 7 derniers jours, combien d'heures [hh_full_name_calc] a t-il consacre pour travailler pour une entreprise"
	label variable hh_10_`i' "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a-t-il passe a moins d'un metre ou dans une source d'eau de surface"
	label variable hh_11_`i' "Quelle(s) source(s) d'eau de surface?"
	label variable hh_11_o_`i' "Autre source"
	label variable hh_12_`i' "Au cours des 12 derniers mois, pourquoi [hh_full_name_calc] a-t-il passé du temps près de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_12_1_`i' "Aller chercher de l'eau pour le menage"
	label variable hh_12_2_`i' "Donner de l'eau au betail"
	label variable hh_12_3_`i' "Aller chercher de l'eau pour l'agriculture"
	label variable hh_12_4_`i' "Laver des vetements"
	label variable hh_12_5_`i' "Faire la vaisselle"
	label variable hh_12_6_`i' "Recolter de la vegetation aquatique"
	label variable hh_12_7_`i' "Nager/se baigner"
	label variable hh_12_8_`i' "Jouer"
	label variable hh_12_a_`i' "Est-ce qu'il a d'autres raisons pour laquelle [hh_full_name_calc] a-t-il passe du temps pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_12_o_`i' "Autre a preciser"
	label variable hh_13_`i'_1 "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_12 = 1 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_13_`i'_2 "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_12 = 2 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_13_`i'_3 "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_12 = 3 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_13_`i'_4 "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_12 = 4 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_13_`i'_5 "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_12 = 5 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_13_`i'_6 "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_12 = 6 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_13_`i'_7 "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_12 = 7 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_13_o_`i' "Au cours des 12 derniers mois, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a [hh_12_o] pres de (< 1 m) ou dans la/les source(s) d'eau"
	label variable hh_14_`i' "Au cours des 12 derniers mois, combien de vegetation aquatique a-t-il/elle recolte pres de (< 1 m) ou dans la/les source(s) d'eau par semaine, en moyenne (en kg)"
	label variable hh_15_`i' "Comment a-t-il utilise la vegetation aquatique"
	label variable hh_15_o_`i' "Autre a preciser"
	label variable hh_16_`i' "Au cours des 12 derniers mois combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a la production d'engrais, son achat, ou son application sur le champ"
	label variable hh_17_`i' "Au cours des 12 derniers mois combien d'heures [hh_full_name_calc] a t-il consacre a la production d'aliments pour le betail par semaine en moyenne"
	label variable hh_18_`i' "Au cours des 7 derniers jours combien d'heures [hh_full_name_calc] a-t-il passe pres de (< 1 m) ou dans une source d'eau de surface"
	label variable hh_19_`i' "Quelle(s) source(s) d'eau de surface"
	label variable hh_19_o_`i' "Autre a preciser"
	label variable hh_20_`i' "Au cours des 7 derniers jours, pourquoi [hh_full_name_calc] a-t-il passe du temps pres de (< 1 m) ou dans la/les source(s) d'eau"
	label variable hh_20_1_`i' "Aller chercher de l'eau pour le menage"
	label variable hh_20_2_`i' "Donner de l'eau au betail"
	label variable hh_20_3_`i' "Aller chercher de l'eau pour l'agriculture"	
	label variable hh_20_4_`i' "Laver des vetements"
	label variable hh_20_5_`i' "Faire la vaisselle"
	label variable hh_20_6_`i' "Recolter de la vegetation aquatique"
	label variable hh_20_7_`i' "Nager/se baigner"
	label variable hh_20_8_`i' "Jouer"
	label variable hh_20_a_`i' "Est-ce qu'il a d'autres raisons pour laquelle [hh_full_name_calc] a-t-il passe du temps pres de (< 1 m) ou dans la/les source(s) d'eau"
	label variable hh_20_o_`i' "Autre a preciser"
	label variable hh_21_`i'_1 "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_20 = 1 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_21_`i'_2 "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_20 = 2 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_21_`i'_3 "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_20 = 3 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_21_`i'_4 "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_20 = 4 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_21_`i'_5 "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_20 = 5 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_21_`i'_6 "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_20 = 6 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_21_`i'_7 "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a hh_20 = 7 pres de (< 1 m) ou dans la/les source(s) d'eau?"
	label variable hh_21_o_`i' "Au cours des 7 derniers jours, combien d'heures par semaine en moyenne [hh_full_name_calc] a t-il consacre a [hh_20_o] pres de (< 1 m) ou dans la/les source(s) d'eau"
	label variable hh_22_`i' "Au cours des 7 derniers jours, combien de vegetation aquatique a-t-il/elle recolte pres de (< 1 m) ou dans la/les source(s) d'eau (en kg)"
	label variable hh_23_`i' "Comment a-t-il utilise la vegetation aquatique"
	label variable hh_23_1_`i' "Vendre"
	label variable hh_23_2_`i' "Engrais"
	label variable hh_23_3_`i' "Alimentation pour le betail"
	label variable hh_23_4_`i' "Matiere premiere pour le biodigesteur"
	label variable hh_23_5_`i' "Rien"
	label variable hh_23_99_`i' "Autre"
	label variable hh_23_o_`i' "Autre a preciser"
	label variable hh_24_`i' "Au cours des 7 derniers jours combien d'heures [hh_full_name_calc] a t-il consacre a la production d'engrais, son achat, ou son application sur le champ?"
	label variable hh_25_`i' "Au cours des 7 derniers jours combien d'heures [hh_full_name_calc] a t-il consacre a la production d'aliments pour le betail"
	label variable hh_26_`i' "[hh_full_name_calc] a-t-il fait ou fait-il des etudes actuellement dans une ecole formelle"
	label variable hh_27_`i' "Est ce que [hh_full_name_calc] a suivi une ecole non formelle ou une formation non-formelle"
	label variable hh_28_`i' "Quel type d'education non-formelle [hh_full_name_calc] a frequente"
	label variable hh_29_`i' "Quel est le niveau et la classe les plus eleves que [hh_full_name_calc] a reussi a l'ecole"
	label variable hh_29_o_`i' "Autre a preciser"
	label variable hh_30_`i' "[hh_full_name_calc] a-t-il frequente une ecole au cours de la derniere annee scolaire 2022-23"
	label variable hh_31_`i' "Quel resultat [hh_full_name_calc] a-t-il obtenu au cours de l'annee 2022/2023"
	label variable hh_32_`i' "Est-ce que [hh_full_name_calc] frequente une ecole au cours de la presente annee scolaire 2023/2024"
	label variable hh_33_`i' "En ce qui concerne les autres eleves de sa classe, pensez-vous que la performance academique de [hh_full_name_calc] est inferieure a celle de la plupart des eleves, a peu pres la meme que celle de la plupart des eleves, ou superieure a celle de la plupart des eleves"
	label variable hh_34_`i' "Quel age avait [hh_full_name_calc] quand il (elle) a cesse d'aller a l'ecole"
	label variable hh_35_`i' "Quelle est le niveau et la classe frequentee par [hh_full_name_calc] au cours de l'annee 2023/2024"
	label variable hh_36_`i' "Pensez-vous que [hh_full_name_calc] reussira son niveau scolaire declare au course de l'annee 2023/2024"
	label variable hh_37_`i' "Au cours des 12 derniers mois, [hh_full_name_calc] a-t-il deja manque plus d'une semaine consecutive d'ecole pour cause de maladie"
	label variable hh_38_`i' "Au cours des 7 derniers jours, combien de jours [hh_full_name_calc] est-il alle a l'ecole pour suivre des cours"
}

*** knowledge section ***
label variable knowledge_01 "Avez-vous deja entendu parler de la bilharziose"
label variable knowledge_02 "Pouvez-vous nous dire en termes simples ce qu'est la bilharziose"
label variable knowledge_03 "Pensez-vous que la bilharziose est une maladie"
label variable knowledge_04 "Si vous pensez que la bilharziose est une maladie, pensez-vous qu'il s'agit d'une maladie grave"
label variable knowledge_05 "Quelle est la cause de la bilharziose"
label variable knowledge_05_o "Autre cause"
label variable knowledge_06 "A votre avis, comment savez-vous si une personne est atteinte de bilharziose"
label variable knowledge_06_1 "Lorsq'ils ont de la fievre"
label variable knowledge_06_2 "En cas de diarrhee"
label variable knowledge_06_3 "En cas de douleurs a l'estomac"
label variable knowledge_06_4 "En cas de sang dans les urines"
label variable knowledge_06_5 "En cas de demangeaisons"
label variable knowledge_06_6 "Je ne sais pas si c'est le cas"
label variable knowledge_07 "Savez-vous s'il existe un test a l'hopital pour detecter la bilharziose chez un individu"
label variable knowledge_08 "Si oui, lequel"
label variable knowledge_09 "Comment une personne peut-elle se proteger contre la bilharziose"
label variable knowledge_09_1 "Eviter d'uriner dans la riviere"
label variable knowledge_09_2 "Eviter de defequer dans la riviere"
label variable knowledge_09_3 "Eviter de se rendre a la riviere"
label variable knowledge_09_4 "Eviter de marcher pieds nus"
label variable knowledge_09_5 "Dormir sous une moustiquaire"
label variable knowledge_09_6 "Retirer les plantes des points d'eau"
label variable knowledge_09_99 "Autre (a preciser)"
label variable knowledge_09_o "Autre precaution"
label variable knowledge_10 "Comment peut-on contracter la bilharziose"
label variable knowledge_10_1 "En marchant pieds nus"
label variable knowledge_10_2 "En mangeant sans se lever les mains"
label variable knowledge_10_3 "En allant a la riviere"
label variable knowledge_10_4 "En buvant l'eau de la riviere"
label variable knowledge_10_5 "En se faisant piquer par des moustiques"
label variable knowledge_10_6 "Lors de rapports sexuels avec une personne infectee par la bilharziose"
label variable knowledge_10_7 "Je ne sais pas"
label variable knowledge_10_99 "Autre specification"
label variable knowledge_10_o "Autre"
label variable knowledge_11 "Pensez-vous que la bilharziose est contagieuse"
label variable knowledge_12 "Connaissez-vous l'animal qui transmet la bilharziose"
label variable knowledge_12_o "Autre animal"
label variable knowledge_13 "Pensez-vous que la bilharziose peut etre guerie sans traitement"
label variable knowledge_14 "Pensez-vous qu'il existe un medicament pour traiter la bilharziose"
label variable knowledge_15 "Connaissez-vous un traitement traditionnel pour la bilharziose"
label variable knowledge_16 "Pensez-vous que ce traitement traditionnel est efficace, qu'il soigne vraiment"
label variable knowledge_17 "Avez-vous des commentaires sur le traitement de la bilharziose"
label variable knowledge_18 "Avez-vous ete en contact avec un plan d'eau (lac, riviere, ruisseau, marais, etc.) au cours des 12 derniers mois"
label variable knowledge_19 "De quel type de plan d'eau s'agissait-il"
label variable knowledge_19_o "Autre type d'eau"
label variable knowledge_20 "Ou etes-vous entre en contact avec la masse d'eau"
label variable knowledge_20_o "Autre lieu"
label variable knowledge_21 "A quelle frequence"
label variable knowledge_22 "Quand y etes-vous alle pour la derniere fois"
label variable knowledge_23 "Quelles sont les raisons pour lesquelles vous avez ete (ou etes) en contact avec le cours d'eau"
label variable knowledge_23_1 "Pour les taches menageres (vaisselle, lessive, etc.)"
label variable knowledge_23_2 "Pour aller chercher de l'eau"
label variable knowledge_23_3 "Pour sa baigner"
label variable knowledge_23_4 "Jouer"
label variable knowledge_23_5 "Pecher"
label variable knowledge_23_6 "Pour mes activites agricoles"
label variable knowledge_23_99 "Pour d'autres raisons"
label variable knowledge_23_o "Autre raison"

*** health module indiviudals - this is for member index 1 ***
*** verify maximum number in data set ****
forvalues i=1/28 {
    label variable health_5_2_`i' "Est-ce que [health-name] est tombe malade au cours des 12 derniers mois"
	label variable health_5_3_`i' "De quel type de maladie ou de blessure a-t-il/elle souffert"
	label variable health_5_3_1_`i' "Paludisme"
	label variable health_5_3_2_`i' "Bilharzoise"
	label variable health_5_3_3_`i' "Diarrhee"
	label variable health_5_3_4_`i' "Blessures"
	label variable health_5_3_5_`i' "Problemes dentaires"
	label variable health_5_3_6_`i' "Problemes de peau"
	label variable health_5_3_7_`i' "Problemes oculaires"
	label variable health_5_3_8_`i' "Problemes de gorge"
	label variable health_5_3_9_`i' "Maux d'estomac"
	label variable health_5_3_10_`i' "Fatigue"
	label variable health_5_3_11_`i' "IST"
	label variable health_5_3_12_`i' "trachome"
	label variable health_5_3_13_`i' "onchocercose"
	label variable health_5_3_14_`i' "filaroise lymphatique"
	label variable health_5_3_99_`i' "autres (a preciser)"
	label variable health_5_3_o_`i' "Autre maladie"
	label variable health_5_4_`i' "Combien de jours a-t-il/elle manque au travail/a l'ecole en raison d'une maladie ou d'une blessure au cours du dernier mois"
	label variable health_5_5_`i' "A-t-il/elle recu des medicaments pour le traitement de la schistosomiase au cours des 12 derniers mois"
	label variable health_5_6_`i' "Cette personne a-t-elle deja ete diagnostiquee avec la schistosomiase"
	label variable health_5_7_`i' "Cette personne a-t-elle ete affectee par la schistosomiase au cours des 12 derniers mois"
	label variable health_5_8_`i' "Cette personne a-t-elle eu du sang dans ses urines au cours des 12 derniers mois"
	label variable health_5_9_`i' "Cette personne a-t-elle eu du sang dans ses selles au cours des 12 derniers mois"
	label variable health_5_10_`i' "Avez-vous consulte quelqu'un pour une maladie au cours des 12 derniers mois"
	label variable health_5_11_`i' "Quel type de service de sante/professionnel de sante cette personne a-t-elle consulte en premier lieu"
	label variable health_5_11_o_`i' "Autre type de service de sante"
	label variable health_5_12_`i' "Quelle est la distance en km qui vous separe de ce service ou de ce professionnel de sante"
}

*** labels for health modules at the household level ***
label variable health_5_13 "Avez-vous beneficie de campagnes de sensibilisation sur la schistosomiase au cours des cinq dernieres annees"
label variable health_5_14_a "Manifestation de la bilharzoise"
label variable health_5_14_b "Pratique pour eviter la bilharzose"
label variable health_5_14_c "Mesurer a prendre pour le traitement de la bilharziose"

*** Assets module ***
label variable list_actifs_1 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Fer a repasser (electrique/non-eletrique)"
label variable list_actifs_2 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Machine a coudre"
label variable list_actifs_3 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Television"
label variable list_actifs_4 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Voiture"
label variable list_actifs_5 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Refridgerateur"
label variable list_actifs_6 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Radio"
label variable list_actifs_7 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Montre/horloge"
label variable list_actifs_8 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Lit ou matelas"
label variable list_actifs_9 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Velo"
label variable list_actifs_10 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Moto"
label variable list_actifs_11 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Table"
label variable list_actifs_12 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Chaise"
label variable list_actifs_13 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Climatiseur"
label variable list_actifs_14 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Ordinateur"
label variable list_actifs_15 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Telephone portable"
label variable list_actifs_16 "Avez-vous l'un des objects suivants dans votre foyer aujourd'hui? En etat de marche - Maison"
label variable _actif_number_1 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_2 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_3 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_4 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_5 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_6 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_7 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_8 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_9 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_10 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_11 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_12 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_13 "Combien de [actifs-name] est-ce que vous avez"
label variable _actif_number_14 "Combien de [actifs-name] est-ce que vous avez"
label variable list_actifs_o "Est-ce qu'il y a un autre actif que l'on a pas pris en compte"
label variable actifs_o "Autre Actifs"
label variable actifs_o_int "Combien de [actifs_o] est-ce que vous avez"
label variable list_agri_equip_1 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Charrue"
label variable list_agri_equip_2 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Arara"
label variable list_agri_equip_3 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Animaux de traits"
label variable list_agri_equip_4 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Charrette"
label variable list_agri_equip_5 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Tracteur"
label variable list_agri_equip_6 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Pulverisateur"
label variable list_agri_equip_7 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Groupe Motos Pompes (GMP)"
label variable list_agri_equip_8 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Houes"
label variable list_agri_equip_9 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Hilaires"
label variable list_agri_equip_10 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Daba/faucille"
label variable list_agri_equip_11 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Semoir"
label variable list_agri_equip_12 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Kadiandou"
label variable list_agri_equip_13 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Fanting"
label variable list_agri_equip_14 "Votre foyer dispose-t-il aujourd'hui de l'un des equipements suivants? En etat de marche - Panneaux solaires"
label variable _agri_number_1 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_2 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_3 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_4 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_5 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_6 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_7 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_8 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_9 "Combien de [agri-name] avez-vous eu" 
label variable _agri_number_10 "Combien de [agri-name] avez-vous eu" 
label variable list_agri_equip_o "Est-ce qu'il y a un autre equipement agricole que l'on n'a pas pris en compte"
label variable list_agri_equip_o_t "Autre liste"
label variable list_agri_equip_int "Combien de [list_agri_equip_o_t] avez-vous eu"

*** Agriculture Inputs Module ***
label variable agri_6_5 "Avez-vous loue la maison ou etes-vous le proprietaire"
label variable agri_6_6 "Combien de pieces separees le menage possede-t-il"
label variable agri_6_7 "Un membre de votre menage a-t-il un compte bancaire"
label variable agri_6_8 "Un membre de votre menage participe-t-il a des mecanismes informels d'epargne et de credit (par exemple, des associations d'epargne et de credit ou des groupes rotatifs d'epargne et de credit)"
label variable agri_6_9 "Un membre de votre menage fait-il partie d'un groupe de femmes du village"
label variable agri_6_10 "Avez-vous un compte d’argent mobile (ex. Orange Money, Wave, Tigo Cash, Freemoney, K-PAYE)"
label variable agri_6_11 "Si vous aviez besoin de 250 000 FCFA d'ici la semaine prochaine (pour une urgence medicale ou une autre dépense imprevue), seriez-vous en mesure de les obtenir"
label variable agri_6_12 "Comment pourriez-vous obtenir cet argent (reponse a choix multiples)"
label variable agri_6_12_1 "Emprunt bancaire"
label variable agri_6_12_2 "Emprunter sur le compte epargne/pret du village (tontine, groupe de preteurs individuels, etc.)"
label variable agri_6_12_3 "Emprunter aupres de voisins, d'amis ou de parents"
label variable agri_6_12_4 "Utiliser son propre compte d'epargne"
label variable agri_6_12_5 "Vendre des recoltes ou du betail"
label variable agri_6_12_6 "Vendre d'autres biens ou proprietes"
label variable agri_6_12_7 "Argent de poche/maison"
label variable agri_6_12_99 " Autre (veuillez preciser)"
label variable agri_6_12_o "Autre possibilite pour avoir l'argent"
label variable agri_6_14 "Est-ce qu'au moins un membre du ménage a cultivé de la terre (y compris des cultures pérennes), qu'elle lui appartienne ou non, au cours de la dernière saison de culture"
label variable agri_6_15 "Combien de parcelles a l'interieur des champs cultives par le menage"

*** parcel questions ****
*** verify maximum in dataset ***
forvalues i=1/4 {
	label variable agri_6_16_`i' "Ordre de numeration du champ"
	label variable agri_6_17_`i' "Numero de la parcelle dans le champ"
	label variable agri_6_18_`i' "Quel est le mode de gestion de la parcelle"
	label variable agri_6_19_`i' "Quel est le numero d'ordre de la personne qui cultive la parcelle (utiliser les identifiants de la section B sur les caracteristiques demographiques du menage)"
	label variable agri_6_20_`i' "Quelle est la principale culture pratiquee sur cette parcelle au cours de la derniere periode de vegetation"
	label variable agri_6_20_o_`i' "Autre culture principale"
	label variable agri_6_21_`i' "Quelle est la superficie de la parcelle selon l'exploitant ? (Indiquer la superficie en hectares ou en metres carres avec deux decimales)"
	label variable agri_6_22_`i' "Unite"
	label variable agri_6_23_`i' "Quel est le mode d'occupation de cette parcelle"
	label variable agri_6_23_o_`i' "Autre mode d'occupation de cette parcelle"
	label variable agri_6_24_`i' "Quel est le numero d'ordre du proprietaire de la parcelle"
	label variable agri_6_25_`i' "Quel est le mode d'acquisition de cette parcelle"
	label variable agri_6_25_o_`i' "Autre mode d'acquisition de cetter parcelle"
	label variable agri_6_26_`i' "Disposez-vous d'un document legal (titre, acte, certificat, etc.) confirmant votre propriete sur cette parcelle"
	label variable agri_6_26_o_`i' "Autre document legal"
	label variable agri_6_27_`i' "Quels sont les membres du menage figurant sur ce document legal"
	label variable agri_6_27_1_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 1"
	label variable agri_6_27_2_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 2"
	label variable agri_6_27_3_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 3"
	label variable agri_6_27_4_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 4"
	label variable agri_6_27_5_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 5"
	label variable agri_6_27_6_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 6"
	label variable agri_6_27_7_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 7"
	label variable agri_6_27_8_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 8"
	label variable agri_6_27_9_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 9"
	label variable agri_6_27_10_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 10"
	label variable agri_6_27_11_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 11"
	label variable agri_6_27_12_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 12"
	label variable agri_6_27_13_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 13"
	label variable agri_6_27_14_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 14"
	label variable agri_6_27_15_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 15"
	label variable agri_6_27_16_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 16"
	label variable agri_6_27_17_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 17"
	label variable agri_6_27_18_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 18"
	label variable agri_6_27_19_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 19"
	label variable agri_6_27_20_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 20"
	label variable agri_6_27_21_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 21"
	label variable agri_6_27_22_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 22"
	label variable agri_6_27_23_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 23"
	label variable agri_6_27_24_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 24"
	label variable agri_6_27_25_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 25"
	label variable agri_6_27_26_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 26"
	label variable agri_6_27_27_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 27"
	label variable agri_6_27_28_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 28"
	label variable agri_6_27_29_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 29"
	label variable agri_6_27_30_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 30"
	label variable agri_6_27_31_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 31"
	label variable agri_6_27_32_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 32"
	label variable agri_6_27_33_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 33"
	label variable agri_6_27_34_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 34"
	label variable agri_6_27_35_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 35"
	label variable agri_6_27_36_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 36"
	label variable agri_6_27_37_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 37"
	label variable agri_6_27_38_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 38"
	label variable agri_6_27_39_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 39"
	label variable agri_6_27_40_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 40"
	label variable agri_6_27_41_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 41"
	label variable agri_6_27_42_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 42"
	label variable agri_6_27_43_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 43"
	label variable agri_6_27_44_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 44"
	label variable agri_6_27_45_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 45"
	label variable agri_6_27_46_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 46"
	label variable agri_6_27_47_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 47"
	label variable agri_6_27_48_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 48"
	label variable agri_6_27_49_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 49"
	label variable agri_6_27_50_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 50"
	label variable agri_6_27_51_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 51"
	label variable agri_6_27_52_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 52"
	label variable agri_6_27_53_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 53"
	label variable agri_6_27_54_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 54"
	label variable agri_6_27_55_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 55"
	label variable agri_6_27_56_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 56"
	label variable agri_6_27_57_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 57"
	label variable agri_6_27_58_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 58"
	label variable agri_6_27_59_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 59"
	label variable agri_6_27_60_`i' "Quels sont les membres du menage figurant sur ce document legal - membre 60"
	label variable agri_6_28_`i' "Pensez-vous qu'il existe un risque de perdre les droits associes a cette parcelle dans les 5 prochaines annees"
	label variable agri_6_29_`i' "Quelle est la principale preoccupation"
	label variable agri_6_29_o_`i' "Autre type de preoccupation"
	label variable agri_6_30_`i' "Avez-vous utilise du fumier animal sur cette parcelle au cours de cette campagne agricole"
	label variable agri_6_31_`i' "Quelle a ete la principale methode d'acquisition de ce fumier"
	label variable agri_6_31_o_`i' "Autre methode d'acquisition de l'animale"
	label variable agri_6_32_`i' "Quelle quantite de fumier avez-vous appliquee sur la parcelle"
	label variable agri_6_33_`i' "Code Unite"
	label variable agri_6_33_o_`i' "Autre type de quantite"
	label variable agri_6_34_comp_`i' "Avez-vous utilise du compost sur cette parcelle durant cette campagne"
	label variable agri_6_34_`i' "Avez-vous utilise des dechets menagers et autres sur cette parcelle au cours de cette campagne agricole"
	label variable agri_6_35_`i' "Combien de fois avez-vous epandu des dechets menagers sur cette parcelle au cours de cette campagne agricole"
	label variable agri_6_36_`i' "Avez-vous utilise des engrais inorganiques/chimiques sur cette parcelle au cours de cette campagne agricole"
	label variable agri_6_37_`i' "Combien de fois avez-vous epandu des engrais inorganiques sur cette parcelle au cours de cette campagne agricole"
	label variable agri_6_38_a_`i' "Quelle quantite d’Uree avez-vous utilisee"
	label variable agri_6_38_a_code_`i' "Unite"
	label variable agri_6_38_a_code_o_`i' "Autre code"
	label variable agri_6_39_a_`i' "Quelle quantite de Phosphates avez-vous utilisee"
	label variable agri_6_39_a_code_`i' "Unite"
	label variable agri_6_39_a_code_o_`i' "Autre code"
	label variable agri_6_40_a_`i' "Quelle quantite de NPK/Formule unique avez-vous utilisee"
	label variable agri_6_40_a_code_`i' "Unite"
	label variable agri_6_40_a_code_o_`i' "Autre code"
	label variable agri_6_41_a_`i' "Quelle quantite d’autres engrais chimiques avez-vous utilisee"
	label variable agri_6_41_a_code_`i' "Unite"
	label variable agri_6_41_a_code_o_`i' "Autre code"
}

*** Agriculture Production Module ***
*** Cereals ***
forvalues i=1/6{
	label variable cereals_consumption_`i' "Votre menage a t'il cultive du [cereals-name] durant cetter periode"
	label variable cereals_01_`i' "Superficie en hecatre de [cereals-name]"
	label variable cereals_02_`i' "Production totale en 2023 (kg) de [cereals-name]"
	label variable cereals_03_`i' "Quantite autoconsommee en 2023 de [cereals-name]"
	label variable cereals_04_`i' "Quantite vendue en kg en 2023 de [cereals-name]"
	label variable cereals_05_`i' "Prix de vente actuel en FCFA/kg de [cereals-name]"
}

*** Farines et tubercules ***
forvalues i=1/6{
	label variable farine_tubercules_consumption_`i' "Votre menage a t'il cultive du [farines_tubercules-name] durant cetter periode"
	label variable farines_01_`i' "Superficie en hecatre de [farines_tubercules-name]"
	label variable farines_02_`i' "Production totale en 2023 (kg) de [farines_tubercules-name]"
	label variable farines_03_`i' "Quantite autoconsommee en 2023 de [farines_tubercules-name]"
	label variable farines_04_`i' "Quantite vendue en kg en 2023 de [farines_tubercules-name]"
	label variable farines_05_`i' "Prix de vente actuel en FCFA/kg de [farines_tubercules-name]"
}

*** legumes ***
forvalues i=1/6{
	label variable legumes_consumption_`i' "Votre menage a t'il cultive du [legumes-name] durant cetter periode"
	label variable legumes_01_`i' "Superficie en hecatre de [legumes-name]"
	label variable legumes_02_`i' "Production totale en 2023 (kg) de [legumes-name]"
	label variable legumes_03_`i' "Quantite autoconsommee en 2023 de [legumes-name]"
	label variable legumes_04_`i' "Quantite vendue en kg en 2023 de [legumes-name]"
	label variable legumes_05_`i' "Prix de vente actuel en FCFA/kg de [legumes-name]"
}

*** Farines et tubercules ***
forvalues i=1/5{
	label variable legumineuses_consumption_`i' "Votre menage a t'il cultive du [legumineuses-name] durant cetter periode"
	label variable legumineuses_01_`i' "Superficie en hecatre de [legumineuses-name]"
	label variable legumineuses_02_`i' "Production totale en 2023 (kg) de [legumineuses-name]"
	label variable legumineuses_03_`i' "Quantite autoconsommee en 2023 de [legumineuses-name]"
	label variable legumineuses_04_`i' "Quantite vendue en kg en 2023 de [legumineuses-name]"
	label variable legumineuses_05_`i' "Prix de vente actuel en FCFA/kg de [legumineuses-name]"
}

*** aquatiques and other production ***
label variable aquatique_consumption_1 "Votre menage a t'il cultive du [aquatique-name] durant cette periode"
label variable aquatique_01_1 "Superficie en hecatre de [aquatique-name]"
label variable aquatique_02_1 "Production totale en 2023 (kg) de [aquatique-name]"
label variable aquatique_03_1 "Quantite autoconsommee en 2023 de [aquatique-name]"
label variable aquatique_04_1 "Quantite vendue en kg en 2023 de [aquatique-name]"
label variable aquatique_05_1 "Prix de vente actuel en FCFA/kg de [aquatique-name]"
label variable autre_culture_yesno "Est-ce qu'il y a un autre type de culture"
label variable autre_culture "Autre type de culture"
label variable o_culture_01 "Superficie en hectare de [autre-culture]"
label variable o_culture_02 "Production totale en 2023 (kg) de [autre-culture]"
label variable o_culture_03 "Quantite autoconsommee en 2023 de [autre-culture]"
label variable o_culture_04 "Qunatite vendue en kg en 2023 de [autre-culture]"
label variable o_culture_05 "Prix de vente actuel en FCFA/kg de [autre-culture]"

*** Food consumption module ***
label variable food01 "Dans les douze (12) derniers mois, combien de mois a dure la periode de soudure"
label variable food02 "Avez-vous (ou un membre de votre famille) exerce un travail remunere pendant cette période pour faire face a la periode de soudure"
label variable food03 "Avez-vous vendu des biens pour subvenir a vos besoins pendant cette periode"
label variable food05 "Le betail"
label variable food06 "Les charrettes"
label variable food07 "Les outils de production"
label variable food08 "Biens materiels"
label variable food09 "Puiser dans d'autres ressources (par exemple, un magasin)"
label variable food10 "Autres, veuillez preciser"
label variable food11 "Des membres du ménage ont-ils migre pendant cette periode en raison de la periode de soudure"
label variable food12 "Avez-vous saute des repas pendant la journee en raison de la periode de soudure"

*** Household Income module ***
label variable agri_income_01 "Avez-vous (ou un membre de votre menage) effectue un travail remunere au cours des 12 derniers mois"
label variable agri_income_02 "De quel type de travail s'agissait-il (s'agissaient-ils)"
label variable agri_income_02_o "Autre type de travail"
label variable agri_income_03 "Quelle est la duree de ce travail (frequence) dans les derniers 12 mois"
label variable agri_income_04 "Unite de temps"
label variable agri_income_05 "Montant recu en nature et/ou en especes (FCFA) pour ce travail"
label variable agri_income_06 "Quel a ete le montant total (en FCFA) des depenses engagees pour ce travail (transport, nourriture, etc.)"
label variable species "Quelles especes les proprietaires possedent-ils"
label variable species_1 "Bovins"
label variable species_2 "Mouton"
label variable species_3 "Chevre"
label variable species_4 "Cheval (equide)"
label variable species_5 "Ane"
label variable species_6 "Animaux de trait"
label variable species_7 "Porcs"
label variable species_8 "Volaille"

*** Livestock ownership questions ***
*** verify maximum in the data ***
forvalues i=1/6 {
	label variable agri_income_07_`i' "Nombre de tetes de [species-name] actuellement"
	label variable agri_income_08_`i' "Nombre de tetes de [species-name] vendues (cette annee)"
	label variable agri_income_09_`i' " Principales raisons de la vente de [species-name]"
	label variable agri_income_09_o_`i' "Autre raison de vendre"
	label variable agri_income_10_`i' "Prix moyen par tete de [species-name] en FCFA"
}

label variable agri_income_07_o "Nombre de tetes de [species_o] actuellement"
label variable agri_income_08_o "Nombre de tetes de [species_o] vendues (cette annee)"
label variable agri_income_09_o_o "Principales raisons de la vente de [species_o]"
label variable agri_income_09_o_o_o "Autre raison de vendre"
label variable agri_income_10_o "Prix moyen par tete de [species_o] en FCFA"
label variable animals_sales "Revenues de l'elevage"
label variable animals_sales_1 "Bovins"
label variable animals_sales_2 "Mouton"
label variable animals_sales_3 "Chevre"
label variable animals_sales_4 "Cheval (equide)"
label variable animals_sales_5 "Ane"
label variable animals_sales_6 "Animaux de trait"
label variable animals_sales_7 "Porcs"
label variable animals_sales_8 "Volaille"
label variable animals_sales_o "Est-ce qu'il y a d'autres animaux vendus par le menage"
label variable animals_sales_t "Autre animal vendu par le menage"

*** Livestock/animal product sales quesitons ***
*** Verify maximum value in data ***
forvalues i=1/5 {
label variable agri_income_11_`i' "Nombre de tetes de [sale_animales-name] vendus"
label variable agri_income_12_`i' "Montant total en FCFA pour la vente de [sale_animales-name]"
label variable agri_income_13_`i' "Nature des produits provenant de [sale_animales-name] vendus"
label variable agri_income_13_1_`i' "Lait"
label variable agri_income_13_2_`i' "Le beurre"
label variable agri_income_13_3_`i' "Le fumier"
label variable agri_income_13_99_`i' "Autres"
label variable agri_income_14_`i' "Montant en FCFA du total de vente pour les produits provenant de [sale_animales-name]"
label variable agri_income_13_autre_`i' "Autre nature"
}

label variable agri_income_11_o "Nombre de tetes de [animals_sales_t] vendus"
label variable agri_income_12_o "Montant total en FCFA pour la vente de [animals_sales_t]"
label variable agri_income_13_o "Nature des produits provenant de [animals_sales_t] vendus"
label variable agri_income_13_o_1 "Lait"
label variable agri_income_13_o_2 "Le beurre"
label variable agri_income_13_o_3 "Le fumier"
label variable agri_income_13_o_99 "Autres"
label variable agri_income_14_o "Montant en FCFA du total de vente pour les produits provenant de [animals_sales_t]"
label variable agri_income_13_o_t "Autre nature"
label variable agri_income_15 "Avez-vous des employes pour vos activites agricoles"
label variable agri_income_16 "Si oui, veuillez en preciser le nombre"
label variable agri_income_17 "Ces employes sont-ils remuneres"
label variable agri_income_18 "Comment sont-ils payes"
label variable agri_income_18_o "Autre type de paiement"
label variable agri_income_19 "Quel est le montant total de la remuneration dans les 12 derniers mois pour tous travailleurs (argent plus en nature)"
label variable agri_income_20 "Type d'activite non agricole"
label variable agri_income_20_1 "Peche"
label variable agri_income_20_2 "Sylviculture"
label variable agri_income_20_3 "Artisanat"
label variable agri_income_20_4 "Commerce"
label variable agri_income_20_5 "Services"
label variable agri_income_20_6 "Emploi salaire"
label variable agri_income_20_7 "Transport"
label variable agri_income_20_8 "Recolte"
label variable agri_income_20_t "Est-ce qu'il y a d'autres activites non agricoles"
label variable agri_income_20_o "Autre type d'activites non agricoles"

*** Revenu non agricole types ***
*** verify maximum in data ***
forvalues i=1/3{
	label variable agri_income_21_h_`i' "Nombre de personnes impliquees dans [agri_income_20-name] (Homme)"
	label variable agri_income_21_f_`i' "Nombre de personnes impliquees dans [agri_income_20-name] (Femme)"
	label variable agri_income_22_`i' "Frequence de [agri_income_20-name] par an (nombre de mois)"
	label variable agri_income_23_`i' "Revenus par frequence (par [agri_income_22] mois)"
	label variable agri_income_24_`i' "Revenue annuel total"
}

label variable agri_income_21_h_o "Nombre de personnes impliquees dans [agri_income_20_o] (Homme)"
label variable agri_income_21_f_o "Nombre de personnes impliquees dans [agri_income_20_o] (Femme)"
label variable agri_income_22_o "Frequence de [agri_income_20_o] par an (nombre de mois)" 
label variable agri_income_23_o "Revenus par frequence (par [agri_income_22_o] mois)"
label variable agri_income_25 "Avez-vous des employes pour vos activites non agricoles"
label variable agri_income_26 "Si oui, veuillez en preciser le nombre"
label variable agri_income_27 "Ces employes sont-ils remuneres"
label variable agri_income_28 "Comment sont-ils payes"
label variable agri_income_28_1 "En nature"
label variable agri_income_28_1 "En argent"
label variable agri_income_28_3 "Autre"
label variable agri_income_28_o "Autre mode de paiement"
label variable agri_income_29 "Quel est le montant total de la remuneration dans les 12 derniers mois pour tous travailleurs (argent plus en nature)"
label variable agri_income_30 "Certains membres de votre menage migrent-ils a l'interieur ou à l'exterieur du pays"
label variable agri_income_31 "Si oui, ou sont-ils ? (Choix multiple possible s'il y a plusieurs personnes dans une autre zone)"
label variable agri_income_31_1 "Un autre region du Senegal"
label variable agri_income_31_2 "Autres pays d'Afrique"
label variable agri_income_31_3 "Europe"
label variable agri_income_31_4 "Amerique"
label variable agri_income_31_5 "Asie"
label variable agri_income_31_6 "Autre regions"
label variable agri_income_31_o "Autre zone de migration"
label variable agri_income_32 "Si oui, envoient-ils de l'argent pour les besoins du menage"
label variable agri_income_33 "Si oui, combien avez-vous recu au total au cours des 12 derniers mois"
label variable agri_income_34 "Avez-vous (ou un membre de votre menage) contracte un prêt au cours des douze (12) derniers mois"
label variable agri_income_35 "Si non, pourquoi ne l'avez-vous pas fait"
label variable agri_income_name "Choisissez les membres de votre menage qui ont contracte un pret"

*** Credit roster questions ***
*** verify maximum in data ***
forvalues i=1/4{
	label variable agri_income_36_`i' "Quel montant de ce pret [credit_ask-name] a t'il contracte"
	label variable agri_income_37_`i' "Aupres de qui [credit_ask-name] a t'il contracte ce pret"
	label variable agri_income_38_`i' "Quel est le montant de ce pret que [credit_ask-name] deja rembourse"
	label variable agri_income_39_`i' "Quel est le montant de ce pret que [credit_ask-name] reste a payer"
}

label variable agri_loan_name "Choisissez les membres de votre menage qui ont prete de l'argent a d'autres personnes"

*** Loan roster questions - right now only one in the data set but my need a loop ***
label variable agri_income_41_1 "Quel est le montant que [loan-name] a prete a d'autres personnes"
label variable agri_income_42_1 "Quel est le montant prete par [loan-name] a d'autres personnes deja paye"
label variable agri_income_43_1 "Quel est le montant prete par [loan-name] a d'autres personnes encore du"
label variable agri_income_44_1 "Quelle est la valeur nette des transferts effectués au cours des 12 derniers mois"

label variable product_divers "Quelles sont les depenses globales du menage au cours des quatre derniers mois, les sources de financement ou les pratiques que vous developpez pour repondre a ces besoins, et qui sont les responsables de ces besoins de financement au sein du menage"
label variable product_divers_1 "Alimentation (produits alimentaires)"
label variable product_divers_2 "La sante"
label variable product_divers_3 "L'education"
label variable product_divers_4 "Eau/Electricite pour le menage"
label variable product_divers_5 "Logement/transport"
label variable product_divers_6 "Depenses pour les appareils menagers et le mobilier"
label variable product_divers_7 "Autres investissements non agricoles"
label variable product_divers_8 "Depenses de construction, de reparation et de modification"
label variable product_divers_9 "Acquisition de moyens de transport"
label variable product_divers_10 "Depenses pour l'habillement et les chaussures du menage"
label variable product_divers_11 "Depenses de reparation et d'achat de divers articles menagers"
label variable product_divers_12 "Depenses pour les ceremonies menageres/acquisition de bijoux et de pierres precieuses"
label variable product_divers_13 "Autres depenses (cadeaux, dons, aides, tabac, alcool, taxes, amendes, assurances)"
label variable product_divers_14 "Frais de telephone/Wifi"
label variable product_divers_99 "Autres depenses"

*** product questions ***
*** verify maximum in data ***
forvalues i=1/11{
	label variable agri_income_45_`i' "Montant en [product-name]"
	label variable agri_income_46_`i' "Source de finacement (choix multiples)"
	label variable agri_income_46_1_`i' "Le credit"
	label variable agri_income_46_2_`i' "Revenus propres"
	label variable agri_income_46_3_`i' "Dons"
	label variable agri_income_46_4_`i' "Autres"
	label variable agri_income_46_o_`i' "Autre source de financement"
}

label variable expenses_goods "Types de dépenses"
label variable expenses_goods_1 "Engrais"
label variable expenses_goods_2 "Aliments pour le betail"
label variable expenses_goods_t "Est-ce qu'il y a d'autre type de depense"
label variable expenses_goods_o "Autre a preciser"
label variable agri_income_47_1 "Montant (KG) de [goods-name]"
label variable agri_income_48_1 "Qunatite (FCFA)"
label variable agri_income_47_2 "Montant (KG) de [goods-name]"
label variable agri_income_48_2 "Qunatite (FCFA)"
label variable agri_income_47_o "Montant (KG) de [expenses_goods_o]"
label variable agri_income_48_o "Qunatite (FCFA)"

*** Living standards section ***
label variable living_01 "Quelle est la principale source d'approvisionnement en eau potable"
label variable living_01_o "Autre source d'approvisionnement en eau"
label variable living_02 "L'eau utilisee est-elle traitee dans le menage"
label variable living_03 "Si oui, comment l'eau est-elle traitee"
label variable living_03_o "Autre type de traitement de l'eau"
label variable living_04 "Quel est le principal type de toilettes utilise par votre menage"
label variable living_04_o "Autre type de toilettes"
label variable living_05 "Quel est le principal combustible utilise pour la cuisine"
label variable living_05_o "Autre type de combustible"
label variable living_06 "Quel est le principal combustible utilise pour l'eclairage"
label variable living_06_o "Autre type de combustible utilise pour l'eclairage"

*** Beleifs section ***
label variable beliefs_01 "Quelle est la probabilite que vous contractiez la bilharziose au cours des 12 prochains mois"
label variable beliefs_02 "Quelle est la probabilite qu'un membre de votre menage contracte la bilharziose au cours des 12 prochains mois"
label variable beliefs_03 "Quelle est la probabilite qu'un enfant choisi au hasard dans votre village, age de 5 a 14 ans, contracte la bilharziose au cours des 12 prochains mois"
label variable beliefs_04 "Dans quelle mesure etes-vous d'accord avec l'affirmation suivante : Les terres de ce village devraient appartenir a la communaute et non a des individus"
label variable beliefs_05 "Dans quelle mesure etes-vous d'accord avec l'affirmation suivante : Les sources d'eau de ce village devraient appartenir a la communaute et non aux individus"
label variable beliefs_06 "Dans quelle mesure etes-vous d'accord avec l'affirmation suivante : Si je travaille sur mes propres terres, j'ai le droit d'utiliser les produits que j'ai obtenus grace a mon travail."
label variable beliefs_07 "Dans quelle mesure etes-vous d'accord avec l'affirmation suivante : Si je travaille sur des terres appartenant a la communaute, j'ai le droit d'utiliser les produits que j'ai obtenus par mon travail."
label variable beliefs_08 "Dans quelle mesure etes-vous d'accord avec l'affirmation suivante : Si je peche dans une source d'eau appartenant a la communaute, j'ai le droit d'utiliser les produits que j'ai obtenus par mon travail."
label variable beliefs_09 "Dans quelle mesure êtes-vous d'accord avec l'affirmation suivante : Si je recolte des produits dans une source d'eau appartenant a la communaute, j'ai le droit d'utiliser les produits que j'ai obtenus par mon travail."

*** Public Goods Games ***
label variable game_intro "Avant d’entrer dans la maison, lancez une piece de monnaie. Notez le resultat ici"
label variable game_01 "Y a-t-il des questions"
label variable game_02 "Veuillez indiquer si vous etes pret a jouer a ce jeu"
label variable consent_game_1 "Pourriez-vous s'il vous plaît reconnaitre que vous avez recu 1200 FCFA"
label variable montant_02 "Montant verse par le repondant pour le jeu A"
label variable game_03 "Y a-t-il des questions"
label variable montant_05 "Montant verse par le repondant pour le jeu B"
label variable montant_07 "Si le montant verse par le repondant pour le jeu B est inferieur a 200 : Pourriez-vous s'il vous plait reconnaitre que vous avez recu 1000 FCFA"
label variable montant_08 "Si le montant verse par le repondant pour le jeu B est d’au moins a 200 : Pourriez-vous s'il vous plait reconnaitre que vous avez recu 1200 FCFA"
label variable face_01 "Y a-t-il des questions"
label variable face_02 "Veuillez indiquer si vous etes pret a jouer a ce jeu"
label variable face_04 "Montant verse par le repondant pour le jeu B"
label variable face_06 "Si le montant verse par le répondant pour le jeu B est inferieur a 200 : Pourriez-vous s'il vous plait reconnaitre que vous avez recu 1000 FCFA"
label variable face_07 "Si le montant verse par le répondant pour le jeu B est d’au moins a 200 : Pourriez-vous s'il vous plait reconnaitre que vous avez reçu 1200 FCFA"
label variable face_09 "Y a-t-il des questions"
label variable face_10 "Veuillez indiquer si, compte tenu de ces instructions, vous etes pret a jouer a ce jeu"
label variable face_11 "Pourriez-vous s'il vous plait reconnaitre que vous avez recu 1200 FCFA"
label variable face_13 "Montant verse par le repondant pour le jeu A"

*** Enumerator Observations ***
label variable enum_01 "D'autres personnes que les repondants ont-elles suivi l'entretien"
label variable enum_02 "Combien de personnes environ ont observe l'entretien"
label variable enum_03 "Quels sont les materiaux principaux utilises pour le toit de la maison ou dort le chef de famille"
label variable enum_03_o "Autre type de materiaux pour le toit"
label variable enum_04 "Quels sont les materiaux principaux utilises pour les murs de la maison ou dort le chef de famille"
label variable enum_04_o "Autre type de materiaux pour les murs"
label variable enum_05 "S'il a ete observe, quels sont les materiaux principaux du sol principal de la maison ou dort le chef de famille"
label variable enum_05_o "Autre type de materiaux pour le sol"
label variable enum_06 "Comment evaluez-vous la comprehension globale des questions par le repondant"
label variable enum_07 "Veuillez indiquer les parties difficiles"
label variable enum_08 "Veuillez donner votre avis sur le revenu du menage"

 
*** Data Checks ***

*** 1. Create household identification number and name the column hhid ***
*** Working directory (DO NOT CHANGE) ***
global village_observations "$master\Data Quality Checks\Instructions and Code\Village_Household_Identifiers"

*create column id: 
	egen hhid = concat(hhid_village hh_numero)

*** 2. Check for missing values

*** 3. Verify if responses are resonable: 
***		a. Starting information: 
***			i. Consent should be 1 
	
	preserve 
	 * Here I validate consent with start_survey - if there's anything in start_survey when consent !=1, => consent needs to be verified. 
    keep if consent != 1 & (missing(start_survey) & length(trim(start_survey)) > 0)
	 * Generate an "issue" variable
    generate issue = "Missing consent"
	keep hhid hh_first_name_1 hh_phone 
  
     * Export the dataset to Excel conditional on there being an issue: 
	if consent != 1{
    export excel using Issue_Household_consent.xlsx, firstrow(variables) replace
	}
	
    restore

***		b.	Household Roster
***			Set file path for all variables pertaining to household_roster (DO NOT CHANGE)
global household_roster "$master\Data Quality Checks\Instructions and Code\Household_Roster"

***			i.	Age between 0 and 90 
forvalues i=1/55 {
    preserve 
    local hh_age hh_age_`i'
    
    keep if `hh_age' < 0 | `hh_age' > 90 
    
    keep hh_first_name_1 hh_phone `hh_age'
  
    * Generate an "issue" variable
    generate issue = "Missing"
  
    * Export the dataset to Excel conditional on there being an issue
    if _N > 0 {
        export excel using Issue_Household_`hh_age'.xlsx, firstrow(variables) replace
    }
  
    restore
}
  
***			ii.	Hh_education_level should be less than two when age is less than 18 

forvalues i=1/55 {
	preserve 
    local hh_age hh_age_`i'
	local hh_education_level hh_education_level_`i'
    gen ind_var = 0
    replace ind_var = 1 if `hh_education_level ' > 2 & `hh_age' > 16
    generate issue = "Missing Hh_education_level" if ind_var == 1
    replace issue = "" if ind_var == 0 
    keep hh_first_name_1 hh_phone `hh_education_level' `hh_age' ind_var issue
    if ind_var == 1 {
        export excel using Issue_Community_q35check_noresponse.xlsx, firstrow(variables) replace
    }
    drop ind_var issue
	restore
}


***			iii.	Hh_education_year_acheive should be less than age 

forvalues i=1/55 {
	preserve 
    local hh_age hh_age_`i'
	local hh_education_level hh_education_level_`i'
    gen ind_var = 0
    replace ind_var = 1 if `hh_education_level ' > 2 & `hh_age' > 16
    generate issue = "Missing Hh_education_level" if ind_var == 1
    replace issue = "" if ind_var == 0 
    keep hh_first_name_1 hh_phone `hh_education_level' `hh_age' ind_var issue
    if ind_var == 1 {
        export excel using Issue_Community_q35check_noresponse.xlsx, firstrow(variables) replace
    }
    drop ind_var issue
	restore
}


***			iv.	hh_01 should be between 0 and 168 or -9 
***			v.	hh_02 should be between 0 and 168 or -9
***			vi.	hh_08 should be between 0 and 168 or -9 
***			vii.	hh_09 should be between 0 and 168 or -9 
***			viii.	hh_10 should be between 0 and 168 or -9  


foreach var of varlist hh_01_* hh_02_* hh_08_* hh_09_* hh_10_* {
    preserve
	
    keep if `var' < 0 | `var' > 168 | `var' != -9
	
	generate issue = "Missing"
    keep hh_first_name_1 hh_phone `var' issue
	
    
    if _N > 0 {
        export excel using Issue_Household_`var'.xlsx, firstrow(variables) replace
    }
    
    restore
}


**# Bookmark #2
***			ix.	The sum of all values for each individual's hh_13 should be less than hh_10 


forvalues i = 1/55 {
	preserve
    local hh_10 hh_10_`i'
    
    forvalues j = 1/7 {
        local hh_13 hh_13_`i'_`j'
        qui sum `hh_13', meanonly
        local sum_hh_13 = r(sum)
        
        if `sum_hh_13' > `hh_10' {
            gen issue = "Issue found: Sum of `hh_13' is greater than `hh_10'"
			
		keep hh_first_name_1 hh_phone `hh_10' issue
            // Export to Excel or perform other actions as needed
			 if _N > 0 {
         export excel using Issue_Household_`hh_13'_`hh_10'.xlsx, firstrow(variables) replace
    }
        }
    } 
	restore
}


***			x.	Hh_21 plus hh_21_o should be greater than hh_18 

clear all

set maxvar 20000

import delimited "C:\Users\km978\Box\NSF Senegal\Baseline Data Collection\Surveys\Baseline CRDES data (Jan-Feb 2024)\DISES_enquete_ménage_FINALE_WIDE_29Jan2024.csv", clear 

***ERROR HERE IS FILE CANT BE SAVED
forvalues i = 1/55 {
    preserve
    local hh_21 hh_21_`i'
    local hh_21_o hh_21_o_`i'
    local hh_18 hh_18_`i'
    
    // Calculate the sum of hh_18_i
    qui sum hh_18_`i'
    local sum_hh_18 = r(sum)
    
    // Calculate the sum of hh_21_o_i
    qui sum hh_21_o_`i'
    local sum_hh_21_o = r(sum)
  ** remove loop and create a local sum - write out the 
  ** writen as scalar 
  local hh_21_j hh_21_`i'_1 + hh_21_`i'_2 + hh_21_`i'_3 +hh_21_`i'_4 + hh_21_`i'_5 + hh_21_`i'_6 + hh_21_`i'_7
  
          
        // Check if sum of hh_21_i_j and hh_21_o_i is less than sum of hh_18_i
      
			gen issue = "Issue found: Sum of `hh_21_i_j' and `hh_21_o_i' is less than `hh_18_i'" if `hh_21_j' + `sum_hh_21_o' < `sum_hh_18' 
       
		keep hh_first_name_1 hh_phone `hh_21_j' `hh_21_o' `hh_18'  issue    
			
			// Export to Excel or perform other actions as needed
         if _N > 0 {
             export excel using Issue_Household_sum_`hh_21'_`hh_21_o'.xlsx, firstrow(variable) replace
            }
    }
    restore
}

***ERROR HERE IS THAT VARIABLES DONT EXIST

forvalues i = 1/55 {
    preserve
    local hh_21 hh_21_`i'
    local hh_21_o hh_21_o_`i'
    local hh_18 hh_18_`i'
    
    * Calculate the sum of hh_18_i
    qui sum hh_18_`i'
    local sum_hh_18 = r(sum)
    
    * Calculate the sum of hh_21_o_i
    qui sum hh_21_o_`i'
    local sum_hh_21_o = r(sum)
    
    * Keep relevant variables outside the inner loop
    keep hh_18_`i' hh_21_o_`i'
    
    forvalues j = 1/7 {
        local hh_21 hh_21_`i'_`j'
        
        * Calculate the sum of hh_21_i_j
        qui sum `hh_21'
        local sum_hh_21 = r(sum)
        
        * Check if sum of hh_21_i_j and hh_21_o_i is less than sum of hh_18_i
        if `sum_hh_21' + `sum_hh_21_o' < `sum_hh_18' {
            gen issue = "Issue found: Sum of `hh_21_i_j' and `hh_21_o_i' is less than `hh_18_i'"
			gen sum_hh_18 = `sum_hh_18'
			gen sum_hh_21_o = `sum_hh_21_o'
			gen sum_hh_21 = `sum_hh_21'
            
            * Export to Excel or perform other actions as needed
            if _N > 0 {
                export excel using Issue_Household_sum_`sum_hh_21'_`sum_hh_21_o'.xlsx, firstrow(variables) replace
            }
        }
    }
    restore
}

***		c.	knowledge section
***		Set path file - DO NOT CHANGE 
global knowledge "$master\Data Quality Checks\Instructions and Code\Knowledge"
***i.	knowledge_10 must select at least one and no more than seven 
preserve
egen knowledge_10_count = rowtotal(knowledge_10_1 knowledge_10_2 knowledge_10_3 knowledge_10_4 knowledge_10_5 knowledge_10_6 knowledge_10_7  knowledge_10_99)
keep if knowledge_10_count < 0 & knowledge_10_count > 7
gen issue = "Issue found: variable in knowledge_10 not selected'"
keep hhid hh_first_name_1 hh_phone knowledge_10 issue
if _N > 0 {
    export excel using issue_knowledge_10_count_.xlsx, firstrow(variables) replace
}
restore


**# Bookmark #1
***				ii.	knowledge_17 should be text t
*** Add notation that this should or MAY be a string 
preserve
keep if missing(knowledge_17) & length(trim(knowledge_17)) == 0
gen issue = "Issue found: missing knowledge_17"
keep hhid hh_first_name_1 hh_phone knowledge_17 issue
if _N > 0 {
    export excel using issue_household_knowledge_17.xlsx, firstrow(variables) replace
}
restore




global agriculture_inputs "$master\Data Quality Checks\Instructions and Code\Agriculture_Inputs"


*** 	d.	agriculture section 
*** 		i.	_actif_number should be between 0 and 100


forvalues i = 1/14 {
preserve

*for _actif
    local var1 _actif_number_`i' 
    keep if `var1' < 0 & `var1' > 100 

generate issue_`var1' = "Issue found: missing actif var"
keep hhid hh_first_name_1 hh_phone `var' issue
if _n > 0 {
export excel using issue_household_`var', firstrow(variables) replace
}
restore

}

***  		iii.	_agri_number should be between 0 and 100

forvalues i = 1/10 {
preserve
    local var _agri_number_`i'
    keep if `var' < 0 & `var' > 100
generate issue = "Issue found: missing _agri_number"
keep hhid hh_first_name_1 hh_phone `var' issue
if _n > 0 {
export excel using issue_household_`var', firstrow(variables) replace
}
restore

}

***			iv.	agri_6_6 should be between 0 and 50

preserve
    keep if agri_6_6 < 0 & agri_6_6 > 50
generate issue = "Issue found: missing agri_6_6"
keep hhid hh_first_name_1 hh_phone agri_6_6 issue
if _n > 0 {
export excel using issue_household_agri_6_6, firstrow(variables) replace
}
restore

***		e.	food consumption section 
*** File path - DO NOT CHANGE
global food_consumption "$master\Data Quality Checks\Instructions and Code\Food_Consumption"

**			i.	food01 should be between 0 and 12 or -9 


preserve
    
   keep if food01 < 0 & food01 > 12 & food01 != -9
generate issue = "Issue found:missing food01 value"
keep hhid hh_first_name_1 hh_phone food01 issue
if _n > 0 {
export excel using issue_household_food01, firstrow(variables) replace
}
restore 


***			ii.	food10 should be text 

preserve
keep if missing(food10) & length(trim(food10)) == 0
generate issue = "Issue found: missing food10 value"
keep hhid hh_first_name_1 hh_phone food10 issue
if _n > 0 {
export excel using issue_household_food10.xlsx, firstrow(variables) replace
}
restore



*** 	f.	household income section
*** 		i.	agri_income_07 should be between 0 and 500
*** 		ii.	agri_income_08 should be between 0 and 500
	
foreach var of varlist agri_income_07_o agri_income_07_1 agri_income_07_2 agri_income_07_3 agri_income_07_4 agri_income_07_5 agri_income_07_6 agri_income_08_o agri_income_08_1 agri_income_08_2 agri_income_08_3 agri_income_08_4 agri_income_08_5 agri_income_08_6 {
   
   preserve
    keep if `var' < 0 & `var' > 500
generate issue = "Issue found: variable value not in bound (0<x<500)"
keep hhid hh_first_name_1 hh_phone `var' issue

if _n > 0 {
export excel using issue_household_`var'.xlsx, firstrow(variables) replace
}

    restore
}

***			v.	agri_income_21_h should be between 0 and 50
***			vi.	agri_income_21_f should be between 0 and 50

foreach var of varlist agri_income_21_h_o agri_income_21_h_1 agri_income_21_h_2 agri_income_21_h_3 agri_income_21_h_4 agri_income_21_f_1 agri_income_21_f_2 agri_income_21_f_3 agri_income_21_f_4 {
preserve
    keep if !missing(`var') & `var' < 0 & `var' > 50
generate issue = "Issue found: variable value not in bound (0<x<50)"
keep hhid hh_first_name_1 hh_phone `var' issue

if _n > 0 {
export excel using issue_household_`var'.xlsx, firstrow(variables) replace
}

    restore
}

***			vii.	agri_income_22 should be less than 12 

foreach var of varlist agri_income_22_o agri_income_22_1 agri_income_22_2 agri_income_22_3 agri_income_22_4 {
preserve
    keep if !missing(`var') & `var' > 12
generate issue = "Issue found: variable value not in bound (x<12)"
keep hhid hh_first_name_1 hh_phone `var' issue

if _n > 0 {
export excel using issue_household_`var'.xlsx, firstrow(variables) replace
}

 restore
}


*** 		ix.	agri_income_45 should be between 0 and 1000000000

forvalues i = 1/11 {
preserve
    local var agri_income_45_`i'
    keep if !missing(`var') & `var' < 0 & `var' > 100
generate issue = "Issue found: variable value not in bound (0<x<1000000000)"
keep hhid hh_first_name_1 hh_phone `var' issue
if _n > 0 {
export excel using issue_household_`var', firstrow(variables) replace
}
restore

}

***			x.	agri_income_47 should be between 0 and 1000000000

foreach var of varlist agri_income_47_o agri_income_47_1 agri_income_47_2 agri_income_48_o agri_income_48_1 agri_income_48_2 {
preserve
  
    keep if !missing(`var') &`var' < 0 & `var' > 1000000000
generate issue = "Issue found: variable value not in bound (0<x<1000000000)"
keep hhid hh_first_name_1 hh_phone `var' issue

	if _n > 0 {
export excel using issue_household_`var', firstrow(variables) replace
}
restore

}


***		g.	public goods games
*** 	File path - DO NOT CHANGE ***
global public_goods "$master\Data Quality Checks\Instructions and Code\Public_Goods"


***			i.	montant_02 should be less than 1200
***			ii.	face_13 should be less than 1200

foreach var of varlist montant_02 face_13  {
preserve
    keep if !missing(`var') & `var' > 12000
generate issue = "Issue found: variable value not in bound (0<x<1200)"
keep hhid hh_first_name_1 hh_phone `var' issue

if _n > 0 {
export excel using issue_household_`var'.xlsx, firstrow(variables) replace
}

    restore
}



***			iii. montant_05 should be less than 1000
***			iv.	face_04 should be less 1000

foreach var of varlist montant_05 face_04 {
preserve
keep if !missing(`var') & `var' > 1000
generate issue = "Issue found: variable value not in bound (x<1000)"
keep hhid hh_first_name_1 hh_phone `var' issue

if _N > 0 {
    export excel using issue_household_`var'.xlsx, firstrow(variables) replace
}
restore
}

**# Bookmark #2
***  4.	questions with dependencies: 
***		a.	starting information 
***			i.	sup_text should be answered when sup = -777, response should be text 
***									PART 01:                                 ***
* error - type mismatch 
preserve 
	gen ind_var = 0
    replace ind_var = 1 if sup == . & sup_txt == . 
	generate issue = "Issue found: missing sup_txt value" if ind_var == 1
		replace issue = "" if ind_var == 0 
	keep hhid hh_first_name_1 hh_phone sup sup_txt ind_var issue
    if ind_var == 1 {
        export excel using Issue_household_sup_text_noresponse.xlsx, firstrow(variables) replace
    }
restore
***									PART 02:                                 ***

**# Bookmark #3
*idk why its still picking up on sup_txt here 
preserve 
	gen ind_var = 0
    replace ind_var = 1 if sup != .  & sup_txt !=.
	generate issue = "Issue found: sup_txt value should not be included" if ind_var == 1
		replace issue = "" if ind_var == 0 
	keep hhid hh_first_name_1 hh_phone sup sup_txt ind_var issue
    if ind_var == 1 {
        export excel using Issue_household_sup_noresponse.xlsx, firstrow(variables) replace
    }
restore


***				ii.	enqu_text should be answered when enqu = -777, response should be text 
**# Bookmark #4 - NEED TO ADJUST FOR WHEN VALUE IS A STRING
***										PART 01:                              ***
preserve 
	gen ind_var = 0
    replace ind_var = 1 if enqu == . & enqu_txt == .
	generate issue = "Issue found: Missing enqu_text value" if ind_var == 1
		replace issue = "" if ind_var == 0 
	keep hhid hh_first_name_1 hh_phone enqu enqu_txt ind_var issue 
    if ind_var == 1 {
        export excel using Issue_Community_enqu_txt_noresponse.xlsx, firstrow(variables) replace
    }
restore

***										PART 02:                              ***
preserve 
	gen ind_var = 0
    replace ind_var = 1 if enqu != . & enqu_txt != .
	generate issue = "Issue found: enqu_text value should not be included" if ind_var == 1
		replace issue = "" if ind_var == 0 
	keep hhid hh_first_name_1 hh_phone enqu enqu_txt ind_var issue 
    if ind_var == 1 {
        export excel using Issue_Community_enqu_txt_response.xlsx, firstrow(variables) replace
    }
restore


*** 		b.	household roster
global household_roster "$master\Data Quality Checks\Instructions and Code\Household_Roster"

***				i.	hh_ethnicity_o should be answered when hh_ethnicity = 99, response should be text 


***										PART 01:                              ***
forvalues i = 1/55 {
preserve
    local hh_ethnicity hh_ethnicity_`i'
	local hh_ethnicity_o hh_ethnicity_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_ethnicity' == 99 & missing(`hh_ethnicity_o') 
		
	generate issue = "Issue found: hh_ethnicity_o is missing"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_ethnicity' `hh_ethnicity_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_ethnicity_o', firstrow(variables) replace
}
restore

}


***										PART 02:                              ***
forvalues i = 1/55 {
preserve
    local hh_ethnicity hh_ethnicity_`i'
	local hh_ethnicity_o hh_ethnicity_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_ethnicity' != 99 & !missing(`hh_ethnicity_o') 
		
	generate issue = "Issue found: there should not be a value for hh_ethnicity_o"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_ethnicity' `hh_ethnicity_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_ethnicity_o', firstrow(variables) replace
}
restore

}


***				ii.	hh_releation_with_o should be answered when hh_relation_with = 12 or hh_relation_with = 13, response should be text 

***										PART 01:                              ***
forvalues i = 1/55 {
preserve
    local hh_relation_with hh_relation_with_`i'
	local hh_relation_with_o hh_relation_with_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_relation_with' == 12 & `hh_relation_with' == 13 & missing(`hh_relation_with_o') 
		
	generate issue = "Issue found: hh_relation_with_o value is missing"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_relation_with' `hh_relation_with_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_relation_with_o', firstrow(variables) replace
}
restore

}

***										PART 02:                              ***

forvalues i = 1/55 {
preserve
    local hh_relation_with hh_relation_with_`i'
	local hh_relation_with_o hh_relation_with_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_relation_with'!= 12 & `hh_relation_with' != 13 & !missing(`hh_relation_with_o') 
		
	generate issue = "Issue found: there should not be a value in hh_relation_with_o"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_relation_with' `hh_relation_with_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_relation_with_o', firstrow(variables) replace
}
restore

}

***				iii.	hh_education_level_o should be answered when hh_education_level = 99, response should be text 

***										PART 01:                              ***
forvalues i = 1/55 {
preserve
	local hh_education_level hh_education_level_`i'
    local hh_education_level_o hh_education_level_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_education_level' == 99 &  missing(`hh_education_level_o') 
		
	generate issue = "Issue found: hh_education_level_o value is missing"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_education_level' `hh_education_level_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_education_level_o', firstrow(variables) replace
}
restore

}


***										PART 02:                              ***

forvalues i = 1/55 {
preserve
	local hh_education_level hh_education_level_`i'
    local hh_education_level_o hh_education_level_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_education_level' != 99 &  !missing(`hh_education_level_o') 
		
	generate issue = "Issue found: there should not be a value for hh_education_level_o"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_education_level' `hh_education_level_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_education_level_o', firstrow(variables) replace
}
restore

}



***		 	iv.	hh_main_activity_o should be answered when hh_main_activity = 99, response should be text 
***										PART 01:                              ***



forvalues i = 1/55 {
preserve
	local hh_main_activity hh_main_activity_`i'
    local hh_main_activity_o hh_main_activity_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_main_activity' == 99 &  missing(`hh_main_activity_o') 
		
	generate issue = "Issue found: hh_main_activity_o value is missing"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_main_activity' `hh_main_activity_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_main_activity_o', firstrow(variables) replace
}
restore

}


***										PART 02:                              ***


forvalues i = 1/55 {
preserve
	local hh_main_activity hh_main_activity_`i'
    local hh_main_activity_o hh_main_activity_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_main_activity' != 99 &  !missing(`hh_main_activity_o') 
		
	generate issue = "Issue found: there should not be a value for hh_main_activity_o"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_main_activity' `hh_main_activity_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_main_activity_o', firstrow(variables) replace
}
restore

}

***				v.	hh_04 should be answered when hh_03 = 1, should be between 0 and 168 or -9 
***										PART 01:                              ***

forvalues i = 1/55 {
preserve
	local hh_04 hh_04_`i'
    local hh_03 hh_03_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_03' == 1 & `hh_04' < 0 & `hh_04' > 168 & `hh_04' != -9

		
	generate issue = "Issue found: hh_04 value is not in bounds (0<x<168) or != -9"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_03' `hh_04' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_04', firstrow(variables) replace
}
restore

}



***										PART 02:                              ***

forvalues i = 1/55 {
preserve
	local hh_04 hh_04_`i'
    local hh_03 hh_03_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_03' != 1 & `hh_04' != .

		
	generate issue = "Issue found: there should not be a value for hh_04"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_03' `hh_04' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_04', firstrow(variables) replace
}
restore

}

*** 		vi.	hh_05 should be answered when hh_03 = 1, should be between 0 and 168 or -9 
***										PART 01:                              ***

forvalues i = 1/55 {
preserve
	local hh_05 hh_05_`i'
    local hh_03 hh_03_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_03' == 1 & `hh_05' < 0 & `hh_05' > 168 & `hh_05' != -9

		
	generate issue = "Issue found: hh_05 value is not in bounds (0<x<168) or != -9"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_03' `hh_05' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_05', firstrow(variables) replace
}
restore

}



***										PART 02:                              ***

forvalues i = 1/55 {
preserve
	local hh_05 hh_05_`i'
    local hh_03 hh_03_`i'
	
	gen ind_var = 0
**# Bookmark #3 idk if this line below make sense tho 
    replace ind_var = 1 if `hh_03' != 1 & `hh_05' != .

		
	generate issue = "Issue found: there should not be a value for hh_05"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_03' `hh_05' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_05', firstrow(variables) replace
}
restore

}


***			vii.	hh_06 should be answered when hh_03 = 1, should be between 0 and 168 or -9 
***										PART 01:                              ***
forvalues i = 1/55 {
preserve
	local hh_06 hh_06_`i'
    local hh_03 hh_03_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_03' == 1 & `hh_06' < 0 & `hh_06' > 168 & `hh_06' != -9

		
	generate issue = "Issue found: hh_06 value is not in bounds (0<x<168) or != -9"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_03' `hh_06' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_06', firstrow(variables) replace
}
restore

}



***										PART 02:                              ***

forvalues i = 1/55 {
preserve
	local hh_06 hh_06_`i'
    local hh_03 hh_03_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_03' != 1 & `hh_06' != .

		
	generate issue = "Issue found: there should not be a value for hh_06"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_03' `hh_06' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_06', firstrow(variables) replace
}
restore

}

*** 		ix.	hh_11 should be answered when hh_10 is greater than 0 
***										PART 01:                              ***

forvalues i = 1/55 {
preserve
	local hh_11 hh_11_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_11' != .

		
	generate issue = "Issue found: there should not be a value in hh_11"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_11' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_11', firstrow(variables) replace
}
restore

}

***										PART 02:                              ***

forvalues i = 1/55 {
preserve
	local hh_11 hh_11_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_11' == .

		
	generate issue = "Issue found: missing hh_11 value"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_11' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_11', firstrow(variables) replace
}
restore

}


***			x.	hh_11_o should be answered when hh_11 = 99 , should be text


***										PART 01:                              ***


forvalues i = 1/55 {
preserve	
    local hh_11 hh_11_`i'
	local hh_11_o hh_11_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_11' == 99 & missing(`hh_11_o') 

		
	generate issue = "Issue found: missing hh_11 value"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_11_o' `hh_11' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_11_o', firstrow(variables) replace
}
restore

}



***										PART 02:                              ***

forvalues i = 1/55 {
preserve	
    local hh_11 hh_11_`i'
	local hh_11_o hh_11_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_11' != 99 & !missing(`hh_11_o') 

		
	generate issue = "Issue found: there should be no value for hh_11_o "
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_11_o' `hh_11' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_11_o', firstrow(variables) replace
}
restore

}

*** xi.	hh_12 should be answered when hh_10 is greater than 0

***										PART 01:                              ***


forvalues i = 1/55 {
    preserve
    local hh_10 hh_10_`i'
    
    gen ind_var = 0  // Define ind_var outside of the inner loop
    
    forvalues j = 1/7 {
        local hh_12 hh_12_`j'_`i'
        replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_12' != .
    }
    
    generate issue = "Issue found: missing hh_12 value"
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12' issue ind_var
    // Export to Excel or perform other actions as needed
    if ind_var == 1 {
        export excel using Issue_Household_missing_`hh_12'_.xlsx, firstrow(variables) replace
    }
    
    restore
}

***										PART 02:                              ***

forvalues i = 1/55 {
    preserve
    local hh_10 hh_10_`i'
    
    gen ind_var = 0  // Define ind_var outside of the inner loop
    
    forvalues j = 1/7 {
        local hh_12 hh_12_`j'_`i'
        replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_12' == .
    }
    
    generate issue = "Issue found: there should be no value in hh_12 "
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12' issue ind_var
    // Export to Excel or perform other actions as needed
    if ind_var == 1 {
        export excel using Issue_Household_`hh_12'_.xlsx, firstrow(variables) replace
    }
    
    restore
}


***			xii.	hh_12_a should be answered when hh_10 is greater than 0 


***										PART 01:                              ***


forvalues i = 1/55 {
preserve	
    local hh_12_a hh_12_a_`i'
	local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_12_a' == .
		
	generate issue = "Issue found: missing hh_12_a value"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12_a' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_10', firstrow(variables) replace
}
restore

}



***										PART 02:                              ***


forvalues i = 1/55 {
preserve	
    local hh_12_a hh_12_a_`i'
	local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_12_a' != .
		
	generate issue = "Issue found: missing hh_12_a value"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12_a' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_10', firstrow(variables) replace
}
restore

}

***			xiii.	hh_12_o should be answered when hh_12_a = 1, should be text 

***										PART 01:                              ***


forvalues i = 1/55 {
preserve	
    local hh_12_a hh_12_a_`i'
	local hh_12_o hh_12_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_12_a' == 1 & missing(`hh_12_o')
		
	generate issue = "Issue found: missing hh_12_o value"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_12_o' `hh_12_a' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_12_o', firstrow(variables) replace
}
restore

}


***										PART 02:                              ***

forvalues i = 1/55 {
preserve	
    local hh_12_a hh_12_a_`i'
	local hh_12_o hh_12_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_12_a' == 0 & !missing(`hh_12_o')
		
	generate issue = "Issue found: missing hh_12_o value"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_12_o' `hh_12_a' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_12_o', firstrow(variables) replace
}
restore

}

**# Bookmark #1 NOT WORKING
*** 			xiv.	hh_13 should be answered when hh_10 is greater than 0, should be between 0 and 168 or -9  

***										PART 01:                              ***


forvalues i = 1/55 {
    preserve
    local hh_10 hh_10_`i'
    
    gen ind_var = 0  // Define ind_var outside of the inner loop
    
    forvalues j = 1/7 {
        local hh_13 hh_13_`i'_`j'
        replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_13' == .
    }
    
    generate issue = "Issue found: missing value in hh_13 "
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_13' issue ind_var
    // Export to Excel or perform other actions as needed
    if ind_var == 1 {
        export excel using Issue_Household_missing_`hh_13'_.xlsx, firstrow(variables) replace
    }
    
    restore
}

***										PART 02:                              ***

forvalues i = 1/55 {
    preserve
    local hh_10 hh_10_`i'
    
    gen ind_var = 0  // Define ind_var outside of the inner loop
    
    forvalues j = 1/7 {
        local hh_13 hh_13_`i'_`j'
        replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_13' != .
    }
    
    generate issue = "Issue found: there should be no value in hh_13 "
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_13' issue ind_var
    // Export to Excel or perform other actions as needed
    if ind_var == 1 {
        export excel using Issue_Household_`hh_13'_.xlsx, firstrow(variables) replace
    }
    
    restore
}


***			xv.	hh_13_o should be answered when hh_12_a = 1, should be between 0 and 168 or -9  

***										PART 01:                              ***

forvalues i = 1/55 {
preserve
	local hh_12_a hh_12_a_`i'
    local hh_13_o hh_13_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_12_a' == 1 & `hh_13_o' < 0 & `hh_13_o' > 168 & `hh_13_o' != -9

		
	generate issue = "Issue found: hh_13_o value is not in bounds (0<x<168) or != -9"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_13_o' `hh_12_a' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_13_o', firstrow(variables) replace
}
restore

}



***										PART 02:                              ***

forvalues i = 1/55 {
preserve
	local hh_12_a hh_12_a_`i'
    local hh_13_o hh_13_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_12_a' != 1 & `hh_13_o' != .

		
	generate issue = "Issue found: there should be no value in hh_13_o"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_13_o' `hh_12_a' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_13_o', firstrow(variables) replace
}
restore

}


**# Bookmark #4 NEED TO FIGURE OUT THIS WHOLE STRING BUISSNESS 
***			xvi.	hh_14 should be answered when hh_10 is greater than 0 and hh_12 = 6 , should be between 0 and 5000000 or -9 

***										PART 01:                              ***

forvalues i = 1/55 {
	
    preserve	
    local hh_14 hh_14_`i'
    local hh_12 hh_12_`i' 
    local hh_10 hh_10_`i'
    
	tostring `hh_12', replace
    gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_12' == "6"  &  `hh_14' ==.
    generate issue = "Issue found: missing hh_14 value"
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12' `hh_14' issue ind_var
    
    if ind_var == 1 {
        export excel using issue_household_missing_`hh_14', firstrow(variables) replace
    }
    
    restore
}




***										PART 02:                              ***

forvalues i = 1/55 {
	
    preserve	
    local hh_14 hh_14_`i'
    local hh_12 hh_12_`i' 
    local hh_10 hh_10_`i'
    
	tostring `hh_12', replace
    gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_12' != "6"  &  `hh_14' != .
    generate issue = "Issue found: there should be no value in hh_14"
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12' `hh_14' issue ind_var
    
    if ind_var == 1 {
        export excel using issue_household_`hh_14', firstrow(variables) replace
    }
    
    restore
}


***			xvii.	hh_15 should be answered when hh_10 is greater than 0 and hh_12 = 6 

***										PART 01:                              ***

forvalues i = 1/55 {
	
    preserve	
    local hh_15 hh_15_`i'
    local hh_12 hh_12_`i' 
    local hh_10 hh_10_`i'
    
	tostring `hh_12', replace
    gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_12' == "6"  &  `hh_15' ==.
    generate issue = "Issue found: missing hh_15 value"
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12' `hh_15' issue ind_var
    
    if ind_var == 1 {
        export excel using issue_household_missing_`hh_15', firstrow(variables) replace
    }
    
    restore
}




***										PART 02:                              ***


forvalues i = 1/55 {
	
    preserve	
    local hh_15 hh_15_`i'
    local hh_12 hh_12_`i' 
    local hh_10 hh_10_`i'
    
	tostring `hh_12', replace
    gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_12' != "6"  &  `hh_15' !=.
    generate issue = "Issue found: there should be no value in hh_15"
    replace issue = "" if ind_var == 0 

    keep hhid hh_first_name_1 hh_phone `hh_10' `hh_12' `hh_15' issue ind_var
    
    if ind_var == 1 {
        export excel using issue_household_`hh_15', firstrow(variables) replace
    }
    
    restore
}

***			xix.	hh_16 should be answered when hh_10 is greater than 0, should be between 0 and 168 or -9  


***										PART 01:                              ***

forvalues i = 1/55 {
preserve
	local hh_16 hh_16_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_16' == . & `hh_16' < 0 & `hh_16' >169

		
	generate issue = "Issue found: hh_16 value is not in bounds (0<x<168) or != -9"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_16' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_16', firstrow(variables) replace
}
restore

}

***										PART 02:                              ***


forvalues i = 1/55 {
preserve
	local hh_16 hh_16_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_16' != .

		
	generate issue = "Issue found: there should be no value in hh_16"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_16' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_16', firstrow(variables) replace
}
restore

}

*** 			xx.	hh_17 should be answered when hh_10 is greater than 0, should be between 0 and 168 and -9  
***										PART 01:                              ***
forvalues i = 1/55 {
preserve
	local hh_17 hh_17_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_17' == . & `hh_17' < 0 & `hh_17' >169

		
	generate issue = "Issue found: hh_17 value is not in bounds (0<x<168) or != -9"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_17' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_17', firstrow(variables) replace
}
restore

}

***										PART 02:                              ***


forvalues i = 1/55 {
preserve
	local hh_17 hh_17_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_17' != .

		
	generate issue = "Issue found: there should be no value in hh_17"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_17' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_17', firstrow(variables) replace
}
restore

}

*** 			xxi.	hh_18 should be answered when hh_10 is greater than 0, should be between 168 and -9  

***										PART 01:                              ***

forvalues i = 1/55 {
preserve
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_18' == . & `hh_18' < 0 & `hh_18' >169

		
	generate issue = "Issue found: hh_18 value is not in bounds (0<x<168) or != -9"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_18', firstrow(variables) replace
}
restore

}

***										PART 02:                              ***


forvalues i = 1/55 {
preserve
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_10' == . & `hh_18' != .

		
	generate issue = "Issue found: there should be no value in hh_18"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_18', firstrow(variables) replace
}
restore

}

***			xxii.	hh_19 should be answered when hh_10 is greater than 0 and hh_18 is greater than 0 


***										PART 01:                              ***

forvalues i = 1/55 {
preserve
	local hh_19 hh_19_`i'
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_18' > 0 & `hh_18' != . & `hh_19' == .

		
	generate issue = "Issue found: `hh_19' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' `hh_19' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_19',  firstrow(variables) replace
}
restore

}

***										PART 02:                              ***


forvalues i = 1/55 {
preserve
	local hh_19 hh_19_`i'
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' == 0 & `hh_18' == 0 &  `hh_19' != . &  `hh_19' != 0

		
	generate issue = "Issue found: there should be no value in `hh_19'"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' `hh_19' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_19',  firstrow(variables) replace
}
restore

}

***			xxiii.	hh_19_o should be answered when hh_19 = 99, should be text  
***										PART 01:                              ***

forvalues i = 1/55 {
preserve
    local hh_19 hh_19_`i'
	local hh_19_o hh_19_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_19' == 99 & missing(`hh_19_o') 
		
	generate issue = "Issue found: hh_19_o is missing"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_19' `hh_19_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_19_o', firstrow(variables) replace
}
restore

}


***										PART 02:                              ***
forvalues i = 1/55 {
preserve
    local hh_19 hh_19_`i'
	local hh_19_o hh_19_o_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_19' != 99 & `hh_19' != . & !missing(`hh_19_o') 
		
	generate issue = "Issue found: there should be no value in hh_19_o"
	*replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_19' `hh_19_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_`hh_19_o', firstrow(variables) replace
}
restore

}

*** 			xxiv.	hh_20 should be answered when hh_10 is greater than 0 and hh_18 is greater than 0 


***										PART 01:                              ***
***other condition may be checked if broader error occurs 
forvalues i = 1/55 {
preserve
	local hh_20 hh_20_`i'
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	tostring `hh_20', replace
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_18' > 0 & `hh_18' != . & missing(`hh_20')

		
	generate issue = "Issue found: `hh_20' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' `hh_20' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_20',  firstrow(variables) replace
}
restore

}

***			xxv.	hh_20_a should be answered when hh_10 is greater than 0 and hh_18 is greater than 0 

***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_20_a hh_20_a_`i'
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_18' > 0 & `hh_18' != . & `hh_20_a' == .

		
	generate issue = "Issue found: `hh_20_a' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' `hh_20_a' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_20_a',  firstrow(variables) replace
}
restore

}


***			xxvi.	hh_20_o should be answered when hh_20_a = 1, should be text  
***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_20_o hh_20_o_`i'
	local hh_20_a hh_20_a_`i'
  	
	**in case any value in in hh_20_o is not a string 
	*tostring `hh_20_o', replace
	gen ind_var = 0
    replace ind_var = 1 if `hh_20_a' == 1 &  missing(`hh_20_o')

		
	generate issue = "Issue found: `hh_20_o' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_20_a' `hh_20_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_20_o',  firstrow(variables) replace
}
restore

}



*** 		xxvii.	hh_21 should be answered when hh_10 is greater than 0, should be between 0 and 168 or -9  
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
    preserve
    local hh_10 hh_10_`i'
    
    gen ind_var = 0  // Define ind_var outside of the inner loop
    
    forvalues j = 1/7 {
        local hh_21 hh_21_`i'_`j'
        replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_21' == .
	      replace ind_var = 0 if missing(hh_20name_`i'_`j') 

    }
    
	  drop if ind_var == 0
	 generate issue = "Issue found: missing value in hh_21 "
     
	keep hhid hh_first_name_1 hh_phone `hh_10' hh_21_`i'* issue ind_var
    // Export to Excel or perform other actions as needed
  
	  if ind_var == 1 {
        export excel using Issue_Household_missing_`hh_21'_.xlsx, firstrow(variables) replace
   
    }
    
    restore
}


***			xxviii.	hh_21_o should be answered when hh_20_a = 1
***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_21_o hh_21_o_`i'
	local hh_20_a hh_20_a_`i'
  	
	**in case any value in in hh_20_o is not a string 
	*tostring `hh_20_o', replace
	gen ind_var = 0
    replace ind_var = 1 if `hh_20_a' == 1 & `hh_21_o' == .

		
	generate issue = "Issue found: `hh_21_o' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_20_a' `hh_21_o' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_21_o',  firstrow(variables) replace
}
restore

}

*** 		xxix.	hh_22 should be answered when hh_20 = 6 and hh_10 is greater than 0 and hh_18 is greater than 0, should be greater than 0 or -9 

***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_22 hh_22_`i'
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	gen ind_var = 0
    replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_18' > 0 & `hh_18' != . & `hh_22' == .

		
	generate issue = "Issue found: `hh_22' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' `hh_22' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_22',  firstrow(variables) replace
}
restore

}

***			xxx.	hh_23 should be answered when hh_20 = 6 and hh_10 is greater than 0 and hh_18 is greater than 0 

***										PART 01:                              ***
***other condition may be checked if broader error occurs
**# Bookmark #3 CHECK TO SEE IF THIS DOES WHAT WE WANT

forvalues i = 1/55 {
preserve
	*local hh_23 hh_23_`i'
	local hh_23_99 hh_23_99_`i'
	local hh_20 hh_20_`i'
	local hh_18 hh_18_`i'
    local hh_10 hh_10_`i'
	
	*tostring `hh_23', replace
	
	gen ind_var = 0
	
	
	 forvalues j = 1/5 {
        local hh_23 hh_23_`j'_`i'
		tostring `hh_23', replace
		tostring `hh_20', replace
	 
			replace ind_var = 1 if `hh_10' > 0 & `hh_10' != . & `hh_18' > 0 & `hh_18' != . & `hh_20' == "6" & ( missing(`hh_23') & missing(`hh_23_99'))
			
   
	 }
   
	generate issue = "Issue found: `hh_23' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_10' `hh_18' `hh_20' `hh_23_99' `hh_23' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_23',  firstrow(variables) replace
}
restore

}

*** 		xxxi.	hh_23_o should be answered when hh_23 = 99, should be text 
***										PART 01:                              ***
**# Bookmark #4 CHECKY CHECK TO MAKE SURE THIS RUNS PROPERLY
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_23 hh_23_`i'
	local hh_23_o hh_23_o_`i'
    
// 	forvalues j = 1/5 {
//         local hh_23 hh_23_`j'_`i'
		
		*destring hh_23, replace
		 tostring `hh_23', replace
		  tostring `hh_23_o', replace
		
	gen ind_var = 0
    replace ind_var = 1 if `hh_23' == "99" & missing(`hh_23_o') 

		
	generate issue = "Issue found: `hh_23_o' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_23_o' `hh_23' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_23_o',  firstrow(variables) replace
}
restore

}

***			xxxii.	the following questions are for ages 4 to 18: hh_26, hh_27, hh_28, hh_29, hh_29_o, hh_30, hh_31, hh_32, hh_33, hh_34, hh_35, hh_36, hh_37, hh_38 



***			1.	hh_27 should be answered when hh_26 = 0 

***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_27 hh_27_`i'
	local hh_26 hh_26_`i'
  	
	**in case any value in in hh_27 is not a string 
	*tostring `hh_27', replace
	gen ind_var = 0
    replace ind_var = 1 if `hh_26' == 0 &  `hh_27' == .
		
	generate issue = "Issue found: `hh_27' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_26' `hh_27' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_27',  firstrow(variables) replace
}
restore

}

***			2.	hh_28 should be answered when hh_27 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_28 hh_28_`i'
	local hh_27 hh_27_`i'
  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_27' == 1 &  `hh_28' == .
		
	generate issue = "Issue found: `hh_28' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_27' `hh_28' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_28',  firstrow(variables) replace
}
restore

}

*** 		3.	hh_29 should be answered when hh_26 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_29 hh_29_`i'
	local hh_26 hh_26_`i'
  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_26' == 1 &  `hh_29' == .
		
	generate issue = "Issue found: `hh_29' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_26' `hh_29' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_29',  firstrow(variables) replace
}
restore

}

*** 		4.	hh_29_o should be answered when hh_29 = 99, should be text  
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_29 hh_29_`i'
	local hh_29_o hh_29_o_`i'
  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_29' == 99 &  missing(`hh_29_o') 
		
	generate issue = "Issue found: `hh_29_o' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_29_o' `hh_29' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_29',  firstrow(variables) replace
}
restore

}

*** 		5.	hh_30 should be answered when hh_26 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_30 hh_30_`i'
	local hh_26 hh_26_`i'
  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_26' == 1 &  `hh_30' == .
		
	generate issue = "Issue found: `hh_30' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_26' `hh_30' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_30',  firstrow(variables) replace
}
restore

}

***				6.	hh_31 should be answered when hh_30 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_31 hh_31_`i'
	local hh_30 hh_30_`i'
	  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_30' == 1 &  `hh_31' == .
		
	generate issue = "Issue found: `hh_31' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_30' `hh_31' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_31',  firstrow(variables) replace
}
restore

}

***			7.	hh_32 should be answered when hh_26 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_32 hh_32_`i'
	local hh_26 hh_26_`i'
	  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_26' == 1 &  `hh_32' == .
		
	generate issue = "Issue found: `hh_32' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_26' `hh_32' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_32',  firstrow(variables) replace
}
restore

}


***			8.	hh_33 should be answered when hh_26 = 1 and hh_32 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_33 hh_33_`i'
	local hh_32 hh_32_`i'
	local hh_26 hh_26_`i'
	  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_26' == 1 & `hh_32' == 1 & `hh_33' == .
		
	generate issue = "Issue found: `hh_33' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_26' `hh_32' `hh_33' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_33',  firstrow(variables) replace
}
restore

}

*** 		9.	hh_34 should be answered when hh_32 = 0 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_33 hh_33_`i'
	local hh_32 hh_32_`i'
	local hh_26 hh_26_`i'
	  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_26' == 1 & `hh_32' == 1 & `hh_33' == .
		
	generate issue = "Issue found: `hh_33' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_26' `hh_32' `hh_33' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_33',  firstrow(variables) replace
}
restore

}


*** 		10.	hh_35 should be answered when hh_32 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_35 hh_35_`i'
	local hh_32 hh_32_`i'
		  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_32' == 1 &  `hh_35' == .
		
	generate issue = "Issue found: `hh_35' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_32' `hh_35' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_35',  firstrow(variables) replace
}
restore

}

*** 		11.	hh_36 should be answered when hh_32 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_36 hh_36_`i'
	local hh_32 hh_32_`i'
		  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_32' == 1 &  `hh_36' == .
		
	generate issue = "Issue found: `hh_36' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_32' `hh_36' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_36',  firstrow(variables) replace
}
restore

}


*** 		12.	hh_37 should be answered when hh_32 = 1 
***										PART 01:                              ***
***other condition may be checked if broader error occurs


forvalues i = 1/55 {
preserve
	local hh_37 hh_37_`i'
	local hh_32 hh_32_`i'
		  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_32' == 1 &  `hh_37' == .
		
	generate issue = "Issue found: `hh_37' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_32' `hh_37' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_37',  firstrow(variables) replace
}
restore

}


*** 13.	hh_38 should be answered when hh_32 = 1, should be between 0 and 7 or -9 
***										PART 01:                              ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve
	local hh_38 hh_38_`i'
	local hh_32 hh_32_`i'
		  	
	gen ind_var = 0
    replace ind_var = 1 if `hh_32' == 1 &  `hh_38' == . & `hh_38' < 0 & `hh_38' > 7 
		
	generate issue = "Issue found: `hh_38' not in bounds (0<x<7) or != -9 "
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `hh_32' `hh_38' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`hh_38',  firstrow(variables) replace
}
restore

}

********************** c.	knowledge section ************************************
				*** File path - THIS DOES NOT CHANGE ***
global knowledge "$master\Data Quality Checks\ Code\Knowledge"



***			i.	knowledge_02 should be answered when knowledge_01 = 1, should be text  

**# Bookmark #5
*** PART ONE ***
***other condition may be checked if broader error occurs

*** ERROR: knowledge_02 not found 

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_01 == 1 & missing(knowledge_02)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_02"
	rename knowledge_02 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name knowledge_01 knowledge_02
    if _N > 0 {
        save "$Knowledge\issue_household_knowledge_02.dta", replace
    }
	
restore 


*** 			ii.	knowledge_03 should be answered when knowledge_01 = 1 
*** PART ONE ***
***other condition may be checked if broader error occurs

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_01 == 1 & missing(knowledge_03)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_03"
	rename knowledge_03 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name knowledge_01  
	
 if _N > 0 {
        export excel issue_household_knowledge_03, firstrow(variables) replace
    }
	
restore


**# Bookmark #7
*** 			iii.	knowledge_04 should be answered when knowledge_03 = 1
*** PART ONE ***
***other condition may be checked if broader error occurs

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_03 == 1 & missing(knowledge_04)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_04"
	rename knowledge_04 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name knowledge_03  
	
 if _N > 0 {
        export excel issue_household_knowledge_04, firstrow(variables) replace
    }
	
restore

***			 iv.	knowledge_05 should be answered when knowledge_04 = 1 
*** PART ONE ***
***other condition may be checked if broader error occurs

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_04 == 1 & missing(knowledge_05)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_04"
	rename knowledge_05 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name knowledge_04  
	
 if _N > 0 {
        export excel issue_household_knowledge_05, firstrow(variables) replace
    }
	
restore

***			v.	knowledge_05_o should be answered when knowledge_05 = 1, should be text
*** PART ONE ***
***other condition may be checked if broader error occurs


preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_05 == 1 & missing(knowledge_05_o)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_05_o"
	rename knowledge_05_o print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name knowledge_05  
	
 if _N > 0 {
        export excel issue_household_knowledge_05, firstrow(variables) replace
    }
	
restore


***			vi.	knowledge_08 should be answered when knowledge_07 = 1, should be text
*** PART ONE ***
***other condition may be checked if broader error occurs 


preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_07 == 1 & missing(knowledge_08)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_08"
	rename knowledge_08 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name knowledge_07  
	
 if _N > 0 {
        export excel issue_household_knowledge_08, firstrow(variables) replace
    }
*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_08, replace
// }
restore

***			viii.	knowledge_10_o should be answered when knowledge_10 = 99, should be text
*** PART ONE ***
***other condition may be checked if broader error occurs 


preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_10 == 99 & missing(knowledge_10_o)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_10_o"
	rename knowledge_10_o print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_08, firstrow(variables) replace
    }
*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_08, replace
// }
restore


*** ix.	knowledge_12_o should be answered when knowledge_12 = 99, should be text
*** PART ONE ***
***other condition may be checked if broader error occurs 

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_12 == 99 & missing(knowledge_12_o)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_12_o"
	rename knowledge_12_o print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_12_o, firstrow(variables) replace
    }
*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_12_o, replace
// }
restore

*** x.	knowledge_16 should be answered when knowledge_15 = 1
*** PART ONE ***
***other condition may be checked if broader error occurs 

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_15 == 1 & missing(knowledge_16)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_16"
	rename knowledge_16 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_16, firstrow(variables) replace
    }
*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_16, replace
// }
restore


*** 		xi.	knowledge_19 should be answered when knowledge_18 = 1
*** PART ONE ***
***other condition may be checked if broader error occurs 

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_18 == 1 & missing(knowledge_19)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_19"
	rename knowledge_19 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_19, firstrow(variables) replace
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_19, replace
// }
restore
    }

***			xii.	knowledge_19_o should be answered when knowledge_19 = 99, should be text 

*** PART ONE ***
***other condition may be checked if broader error occurs 

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_19_o == 99 & missing(knowledge_19)
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_19"
	rename knowledge_19 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_19, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_19, replace
// }
restore
    }



***			xiii.	knowledge_20 should be answered when knowledge_18 = 1 


preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_18 == 1 & knowledge_20 == .
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_20"
	rename knowledge_20 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_20, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_20, replace
// }
restore
    
***			xiv.	knowledge_20_o should be answered when knowledge_20 = 99, should be text

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_20 == 99 & missing(knowledge_20_o) 
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_20_o"
	rename knowledge_20_o print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_20_o, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_20_o, replace
// }
restore


***			xv.	knowledge_21 should be answered when knowledge_18 = 1 
*** PART ONE ***
***other condition may be checked if broader error occurs 
**CHANGE THIS LOL
cd C:\Users\Kateri\Downloads
preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_18 == 1 & knowledge_21 == . 
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_21"
	rename knowledge_21 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_21, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_20_o, replace
// }
restore

*** 		xvi.	knowledge_22 should be answered when knowledge_18 = 1
*** PART ONE ***
***other condition may be checked if broader error occurs  

preserve 

	gen ind_var = 0
    replace ind_var = 1 if knowledge_18 == 1 & knowledge_22 == . 
	keep if ind_var == 1 
	
	generate issue = "Missing"
	generate issue_variable_name = "knowledge_22"
	rename knowledge_22 print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_22, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_22, replace
// }
restore


***			xvii.	knowledge_23 should be answered when knowledge_18 = 1
*** PART ONE ***
***other condition may be checked if broader error occurs  

 
*** idk if this line actually works generate issue_variable_name = `var'
foreach var of varlist knowledge_23_1 knowledge_23_2 knowledge_23_3 knowledge_23_4 knowledge_23_5 knowledge_23_6 knowledge_23_99 {

	preserve
	gen ind_var = 0
    replace ind_var = 1 if knowledge_18 == 1 & `var' == . 
	keep if ind_var == 1 
	
	
	generate issue = "Missing"
	generate issue_variable_name = `var'
	rename `var' print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_`var', firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_`var', replace
// }
restore

}

*** 		xviii.	knowledge_23_o should be answered when knowledge_23 = 99, should be text
*** PART ONE ***
***other condition may be checked if broader error occurs  

	preserve
	gen ind_var = 0
    replace ind_var = 1 if knowledge_23 == "99" & missing(knowledge_23_o) 
	keep if ind_var == 1 
	
	
	generate issue = "Missing"
	generate issue_variable_name = knowledge_23_o
	rename knowledge_23_o print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_knowledge_23_o, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Knowledge\issue_household_knowledge_23_o, replace
// }
restore

************************* d.	health section *************************************

***			i.	health_5_3 should be answered when health_5_2 = 1 


forvalues i = 1/55 {
preserve

	local health_5_2 health_5_2_`i'
		
	*tostring `hh_23', replace
	
	gen ind_var = 0
	 forvalues j = 1/14 {
        local health_5_3 health_5_3_`j'_`i'
		replace ind_var = 1 if `health_5_2' == 1 & `health_5_3' == .
				 }
   
	generate issue = "Issue found: `health_5_3' value is missing"
	replace issue = "" if ind_var == 0 

	keep hhid hh_first_name_1 hh_phone `health_5_2' `health_5_3' issue ind_var
	
if ind_var == 1 {
export excel using issue_household_missing_`health_5_3',  firstrow(variables) replace
}
*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_`health_5_3', replace
// }
restore

}

*** 		ii.	health_5_3_o should be answered when health_5_3 = 99, should be text 

*** PART ONE ***
***other condition may be checked if broader error occurs 
 
forvalues i = 1/55 {
preserve
	local health_5_3 health_5_3_`i'
	local health_5_3_o health_5_3_o_`i'
	
	gen ind_var = 0
	tostring `health_5_3_o', replace
	tostring `health_5_3', replace
    replace ind_var = 1 if `health_5_3' == "99" & missing(`health_5_3_o') 
	keep if ind_var == 1 
	
	*****RENAMING ISN'T WORKING
	generate issue = "Missing"
	generate issue_variable_name = `health_5_3_o'
	rename `health_5_3_o' print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_`health_5_3_o', firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_`health_5_3_o', replace
// }
restore
}


***			iii.	health_5_4 should be answered when health_5_2 = 1 
*** PART ONE ***
***other condition may be checked if broader error occurs 
 

forvalues i = 1/55 {
preserve

	local health_5_4 health_5_4_`i'
	local health_5_2 health_5_2_`i'
	
	gen ind_var = 0
	
    replace ind_var = 1 if `health_5_2' == 1 & `health_5_4' == .
	keep if ind_var == 1 
	
	*****RENAMING ISN'T WORKING
	generate issue = "Missing"
	generate issue_variable_name = `health_5_4'
	rename `health_5_4' print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_`health_5_4', firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_`health_5_4', replace
// }
restore
}

***		iv.	health_5_11 should be answered when health_5_10 = 1
*** PART ONE ***
***other condition may be checked if broader error occurs 

forvalues i = 1/55 {
preserve

	local health_5_11 health_5_11_`i'
	local health_5_10 health_5_10_`i'
	
	gen ind_var = 0
	
    replace ind_var = 1 if `health_5_10' == 1 & `health_5_11' == .
	keep if ind_var == 1 
	
	*****RENAMING ISN'T WORKING
	generate issue = "Missing"
	generate issue_variable_name = `health_5_11'
	rename `health_5_11' print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_`health_5_11', firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_`health_5_11', replace
// }
restore
}


*** v.		health_5_11_o should be answered when health_5_11 = 99, should be text
*** PART ONE ***
***other condition may be checked if broader error occurs 


forvalues i = 1/55 {
preserve

	local health_5_11 health_5_11_`i'
	local health_5_11_o health_5_11_o_`i'
	
	gen ind_var = 0
	
    replace ind_var = 1 if `health_5_11' == 99 & missing(`health_5_11_o')
	keep if ind_var == 1 
	
	*****RENAMING ISN'T WORKING
	generate issue = "Missing"
	generate issue_variable_name = `health_5_11_o'
	rename `health_5_11_o' print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_`health_5_11_o', firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_`health_5_11_o', replace
// }
restore
}

****		vi.	health_5_12 should be answered when health_5_10 = 1, should be between 0 and 150 
*** PART ONE ***
***other condition may be checked if broader error occurs

forvalues i = 1/55 {
preserve

	local health_5_12 health_5_12_`i'
	local health_5_10 health_5_10_`i'
	
	gen ind_var = 0
	
    replace ind_var = 1 if `health_5_10' == 1 & `health_5_12' < 0 &  `health_5_12' > 150 & `health_5_12' == .
	keep if ind_var == 1 
	
	*****RENAMING ISN'T WORKING
	generate issue = "Issue found: value is Out of bounds (0<x<150) "
	generate issue_variable_name = `health_5_12'
	rename `health_5_12' print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_`health_5_12', firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_`health_5_12', replace
// }
restore
}

*** 		vii.	health_5_14_a should be answered when health_5_13 = 1 
*** PART ONE ***
***other condition may be checked if broader error occurs


	preserve
	gen ind_var = 0
    replace ind_var = 1 if health_5_13 == 1 & health_5_14_a == . 
	keep if ind_var == 1 
	
	
	generate issue = "Missing"
	generate issue_variable_name = health_5_14_a
	rename health_5_14_a print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_health_5_14_a, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_health_5_14_a, replace
// }
restore

***			 viii.	health_5_14_b should be answered when health_5_13 = 1
*** PART ONE ***
***other condition may be checked if broader error occurs 

	preserve
	gen ind_var = 0
    replace ind_var = 1 if health_5_13 == 1 & health_5_14_b == . 
	keep if ind_var == 1 
	
	
	generate issue = "Missing"
	generate issue_variable_name = health_5_14_b
	rename health_5_14_b print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_health_5_14_b, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_health_5_14_b, replace
// }
restore


***			ix.	health_5_14_c should be answered when health_5_13 = 1 
*** PART ONE ***
***other condition may be checked if broader error occurs

	preserve
	gen ind_var = 0
    replace ind_var = 1 if health_5_13 == 1 & health_5_14_c == . 
	keep if ind_var == 1 
	
	
	generate issue = "Missing"
	generate issue_variable_name = health_5_14_c
	rename health_5_14_c print_issue
	keep hhid hh_first_name_1 hh_phone issue print_issue issue_variable_name   
	
 if _N > 0 {
        export excel issue_household_health_5_14_c, firstrow(variables) replace
    }
		*** for when paths start to work 
// if _N > 0 {
//     save "$Health\issue_household_health_5_14_c, replace
// }
restore
















