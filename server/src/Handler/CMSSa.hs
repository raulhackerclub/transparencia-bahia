{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.CMSSa where

import Data.FileEmbed (embedFile)
import Import

-- getCMSSaR :: Handler ()
-- getCMSSaR = do
--    let indexPath = "static/reports/outputs/descriptive-v3.html"
--    sendFile "text/html" indexPath
getCMSSaR :: Handler TypedContent
getCMSSaR = return $ TypedContent "text/csv"  
                    $ toContent $(embedFile "static/reports/data/cms-ba/despesas.csv")
