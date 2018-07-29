{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.TCMBa where

import Data.FileEmbed (embedFile)
import Import

-- getDatasetR :: Handler ()
-- getDatasetR = do
--    let indexPath = "static/reports/outputs/descriptive-v3.html"
--    sendFile "text/html" indexPath
getTCMBaR :: Handler TypedContent
getTCMBaR = return $ TypedContent "text/csv"  
                    $ toContent $(embedFile "static/reports/data/tcm-ba/tabela_despesas_municipais_tidy_data_BR.csv")
