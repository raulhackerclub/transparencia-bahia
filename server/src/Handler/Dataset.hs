{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Dataset where

import Data.FileEmbed (embedFile)
import Import

-- getDatasetR :: Handler ()
-- getDatasetR = do
--    let indexPath = "static/reports/outputs/descriptive-v3.html"
--    sendFile "text/html" indexPath
getDatasetR :: Handler TypedContent
getDatasetR = return $ TypedContent "text/csv"  
                    $ toContent $(embedFile "static/reports/data/tcm-ba/despesas.csv")
