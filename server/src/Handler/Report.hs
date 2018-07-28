{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Report where

import Data.FileEmbed (embedFile)
import Import

-- getReportR :: Handler ()
-- getReportR = do
--    let indexPath = "static/reports/outputs/descriptive-v3.html"
--    sendFile "text/html" indexPath
getReportR :: Handler TypedContent
getReportR = return $ TypedContent "text/html"  
                    $ toContent $(embedFile "static/reports/outputs/descriptive-v3.html")
