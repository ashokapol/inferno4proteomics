using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using DAnTE.Properties;

namespace DAnTE.Purgatorio
{
    public class clsAnovaPar
    {
        private string rcmd;
        [DAnTE.Tools.clsAnalysisAttribute("Check_for_Unbalance_Data", "ANOVA")]
        public bool unbalanced;
        public bool randomE;
        [DAnTE.Tools.clsAnalysisAttribute("Use_Restricted_Maximum_Likelihood", "ANOVA")]
        public bool useREML;
        [DAnTE.Tools.clsAnalysisAttribute("Check_Interactions", "ANOVA")]
        public bool interactions;
        //[DAnTE.Tools.clsAnalysisAttribute("Dataset(R)", "ANOVA")]
        public string Rdataset;
        [DAnTE.Tools.clsAnalysisAttribute("Source_DataTable", "ANOVA")]
        public string mstrDatasetName;
        public string tempFile;
        [DAnTE.Tools.clsAnalysisAttribute("Minimum_Datapoints_Needed", "ANOVA")]
        public int numDatapts;
        public ArrayList fixedEff;
        public ArrayList randomEff;
        public ArrayList marrFactors;

        public clsAnovaPar()
        {
            unbalanced = false;
            randomE = false;
            useREML = false;
            interactions = false;
            Rdataset = "Eset";
            tempFile = "C:/";
            numDatapts = 3;
            fixedEff = new ArrayList();
            randomEff = new ArrayList();
        }

        public string Rcmd
        {
            get
            {
                rcmd = "anovaR <- DoAnova(" + Rdataset + ",FixedEffects=" + FixedEffects +
                    ",RandomEffects=" + RandomEffects + ",thres=" + numDatapts + "," +
                    Interactions + "," + Unbalanced + "," + UseREML +")";
                return rcmd;
            }
        }

        [DAnTE.Tools.clsAnalysisAttribute("Fixed_Effect_Factors", "ANOVA")]
        public string FixedEffectsFactors
        {
            get
            {
                string fEff;

                if (fixedEff.Count == 0)
                    return "None";
                else
                    fEff = fixedEff[0].ToString();

                for (int i = 1; i < fixedEff.Count; i++)
                {
                    fEff = fEff + "," + fixedEff[i].ToString();
                }

                return fEff;
            }
        }

        private string FixedEffects
        {
            get
            {
                string fEff;

                if (fixedEff.Count == 0)
                    return "NULL";
                else
                    fEff = @"c(""" + fixedEff[0].ToString() + @"""";

                for (int i = 1; i < fixedEff.Count; i++)
                {
                    fEff = fEff +  @",""" + fixedEff[i].ToString() + @"""";
                }
                fEff = fEff + ")";

                return fEff;
            }
        }

        [DAnTE.Tools.clsAnalysisAttribute("Random_Effect_Factors", "ANOVA")]
        public string RandomEffectsFactors
        {
            get
            {
                string rEff;

                if (randomEff.Count == 0)
                    return "None";
                else
                    rEff = randomEff[0].ToString();

                for (int i = 1; i < randomEff.Count; i++)
                {
                    rEff = rEff + "," + randomEff[i].ToString();
                }

                return rEff;
            }
        }

        private string RandomEffects
        {
            get
            {
                string rEff;

                if (randomEff.Count == 0)
                    return "NULL";
                else
                    rEff = @"c(""" + randomEff[0].ToString() + @"""";

                for (int i = 1; i < randomEff.Count; i++)
                {
                    rEff = rEff + @",""" + randomEff[i].ToString() + @"""";
                }
                rEff = rEff + ")";

                return rEff;
            }
        }

        private string UseREML
        {
            get
            {
                if (useREML)
                    return "useREML=TRUE";
                else
                    return "useREML=FALSE";
            }
        }

        private string Interactions
        {
            get
            {
                if (interactions)
                    return "interact=TRUE";
                else
                    return "interact=FALSE";
            }
        }

        private string Unbalanced
        {
            get
            {
                if (unbalanced)
                    return "unbalanced=TRUE";
                else
                    return "unbalanced=FALSE";
            }
        }
    }
}
