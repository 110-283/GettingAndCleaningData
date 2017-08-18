### Data dictionary
___

* ActivityName
    * Name of activity undertaken by a subject
    * Can take the following values:
        * LAYING
        * SITTING
        * STANDING
        * WALKING
        * WALKING_DOWNSTAIRS
        * WALKING_UPSTAIRS
* SubjectNumber
    * Number of subject participated in the research
    * Integer value between 1 and 30 (all values are present)
* MeanOfBodyAccAlong{XYZ}
    * Mean value of accelerometer signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyAccAlong{XYZ}
    * Standard deviation of accelerometer signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfGravityAccAlong{XYZ}
    * Mean value of accelerometer signal associated with gravity along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfGravityAccAlong{XYZ}
    * Standard deviation of accelerometer signal associated with gravity along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyAccelJerkSignalAlong{XYZ}
    * Mean value of jerk accelerometr signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyAccelJerkSignalAlong{XYZ}
    * Standard deviation of jerk accelerometer signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyGyroAlong{XYZ}
    * Mean value of gyroscope signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyGyroAlong{XYZ}
    * Standard deviation of gyroscope signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyGyroJerkSignalAlong{XYZ}
    * Mean value of jerk gyroscope signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyGyroJerkSignalAlong{XYZ}
    * Standard deviation of jerk signal from gyroscope associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyAccMagnitude
    * Mean value of accelerometer signal magnitude associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyAccMagnitude
    * Standard deviation of accelerometer signal magnitude associated with a body
    * Normalized dimensionless number between -1 and 1
* MeanOfGravityAccMagnitude
    * Mean value of accelerometer signal magnitude associated with gravity
    * Normalized dimensionless number between -1 and 1
* StDevOfGravityAccMagnitude
    * Standard deviation of accelerometer signal magnitude associated with gravity
    * Normalized dimensionless number between -1 and 1
* MeanOfMagnitudeOfBodyAccJerkSignal
    * Mean value of jerk time signal magnitude of accelerometer associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfMagnitudeOfBodyAccJerkSignal
    * Standard deviation of magnitude of jerk signal of accelerometer associated with a body
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyGyroMagnitude
    * Mean value of magnitude of gyroscope signal associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyGyroMagnitude
    * Standard deviation of gyroscope time signal magnitude associated with a body
    * Normalized dimensionless number between -1 and 1
* MeanOfMagnitudeOfBodyGyroJerkSignal
    * Mean value of magnitude of jerk signal of gyroscope associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfMagnitudeOfBodyGyroJerkSignal
    * Standard deviation of magnitude of jerk signal of gyroscope associated with a body
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyAccFreqDomAlong{XYZ}
    * Mean value of frequency-domain accelerometer signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyAccFreqDomAlong{XYZ}
    * Standard deviation of frequency-domain accelerometer signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyAccFreqDomJerkSignalAlong{XYZ}
    * Mean value of frequency-domain jerk signal of accelerometer associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyAccFreqDomJerkSignalAlong{XYZ}
    * Standard deviation of frequency-domain jerk signal of accelerometer associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyGyroFreqDomAlong{XYZ}
    * Mean value of frequency-domain gyroscope signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyGyroFreqDomAlong{XYZ}
    * Standard deviation of frequency-domain gyroscope signal associated with a body along {XYZ} axis
    * Normalized dimensionless number between -1 and 1
* MeanOfBodyAccMagnitudeFreqDom
    * Mean of frequency-domain accelerometer signal magnitude associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfBodyAccMagnitudeFreqDom
    * Standard deviation of magnitude of frequency-domain accelerometer signal associated with a body
    * Normalized dimensionless number between -1 and 1
* MeanOfMagnitudeOfBodyAccJerkSignalFreqDom
    * Mean value of magnitude of frequency-domain jerk signal of accelerometer associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfMagnitudeOfBodyAccJerkSignalFreqDom
    * Standard deviation of magnitude of frequency-domain jerk signal of accelerometer associated with a body
    * Normalized dimensionless number between -1 and 1
* MeanOfMagnitudeOfBodyGyroFreqDom
    * Mean value of magnitude of frequency-domain gyroscope signal associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfMagnitudeOfBodyGyroFreqDom
    * Standard deviation of magnitude of frequency-domain gyroscope signal associated with a body
    * Normalized dimensionless number between -1 and 1
* MeanOfMagnitudeOfBodyGyroJerkSignalFreqDom
    * Mean value of magnitude of frequency-domain jerk signal of gyroscope associated with a body
    * Normalized dimensionless number between -1 and 1
* StDevOfMagnitudeOfBodyGyroJerkSignalFreqDom
    * Standard deviation of magnitude of frequency-domain jerk signal of gyroscope associated with a body
    * Normalized dimensionless number between -1 and 1
    
It should be noted that the initial set contains much more variables, but, according to the task formulation, only "mean" and "standard deviation" were chosen for the final dataset. 