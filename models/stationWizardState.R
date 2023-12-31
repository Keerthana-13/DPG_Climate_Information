#' stationWizardState constructor
#'
#' new_stationWizardState isn't intended for external use.
#' Instead, use @seealso [stationWizardState()] which will validate arguments.
#'
new_stationWizardState <- function(stationName = character(),
                                    latitude = double(),
                                    longitude = double(),
                                    dataFile = NULL,
                                    baseStart = integer(),
                                    baseEnd = integer(),
                                    isQCCompleted = FALSE,
                                    qualityControlErrors = "",
                                    indexCalculationStatus = "",
                                    indexCalculationErrors = "",
                                    correlationCalculationStatus = "",
                                    correlationCalculationErrors = "",
                                    climdexInput = NULL,
                                    metadata = NULL,
                                    outputFolders = NULL,
                                    climdexInputParams = NULL,
                                    sectorInputParams = NULL) {
  # basic type validation
  stopifnot(is.character(stationName))
  stopifnot(is.double(latitude))
  stopifnot(is.double(longitude))
  stopifnot(is.integer(baseStart))
  stopifnot(is.integer(baseEnd))
  stopifnot(is.logical(isQCCompleted))
  stopifnot(is.character(qualityControlErrors))
  stopifnot(is.character(indexCalculationStatus))
  stopifnot(is.character(indexCalculationErrors))
  stopifnot(is.character(correlationCalculationStatus))
  stopifnot(is.character(correlationCalculationErrors))

  value <- structure(list(stationName = reactiveVal(stationName),
                          latitude = reactiveVal(latitude),
                          longitude = reactiveVal(longitude),
                          dataFile = reactiveVal(dataFile),
                          baseStart = reactiveVal(baseStart),
                          baseEnd = reactiveVal(baseEnd),
                          isQCCompleted = reactiveVal(isQCCompleted),
                          qualityControlErrors = reactiveVal(qualityControlErrors),
                          indexCalculationStatus = reactiveVal(indexCalculationStatus),
                          indexCalculationErrors = reactiveVal(indexCalculationErrors),
                          correlationCalculationStatus = reactiveVal(correlationCalculationStatus),
                          correlationCalculationErrors = reactiveVal(correlationCalculationErrors),
                          climdexInput = reactiveVal(climdexInput),
                          metadata = reactiveVal(metadata),
                          outputFolders = reactiveVal(outputFolders),
                          climdexInputParams = reactiveVal(climdexInputParams),
                          sectorInputParams = reactiveVal(sectorInputParams)
                      ),
                      class = "stationWizardState"
                    )
  return(value)
}

#' stationWizardState validator
#'
#' This function will be called by @seealso [stationWizardState()]
#' when creating a new stationWizardState.
#'
#' Checks that request attributes are valid.
#' @param r A stationWizardState to validate
#'
#' @return If all attributes are valid, the stationWizardState is returned. 
#' Otherwise an error is returned describing the problem with validation.
validate_stationWizardState <- function(r) {
  if (class(r) != "stationWizardState") {
    stop("Can only validate stationWizardState class.")
  }
  if (length(r$stationName) == 0) {
    stop("Station name must not be empty.")
  }
  if (r$latitude > 90 || r$latitude < -90) {
    stop("Latitude must be between -90 and 90.", call. = FALSE)
  }
  if (r$longitude > 180 || r$longitude < -180) {
    stop("Longitude must be between -180 and 180", call. = FALSE)
  }
  return(r)
}


#' stationWizardState constructor for consumers
#'
#' Creates a new stationWizardState and validates all attributes are valid.
#'
#' @param stationName             character Station name
#' @param latitude                double    Station latitude in decimal degrees
#' @param longitude               double    Station longitude in decimal degrees
#' @param dataFile                dataframe Describes (via name, size, type, datapath) the file
#'                                          containing weather observations provided by the user @seealso [shiny::fileInput()]
#' @param baseStart               integer   Base period start. First year to use in calculations. Must be equal or greater than first year in file.
#' @param baseEnd                 integer   Base period end. Last year to use in calculations. Must be equal or lesser than last year in file.
#' @param isQCCompleted           logical   Has data been quality control checked
#' @param qualityControlErrors    character All errors obtained performing quality checks on dataFile
#' @param climdexInput            object    Climdex input object created from dataFile using climdex.pcic package
#' @param metadata                object    List of items used in calculations. To be refactored, but maintained for now to simplify refactoring.
#' @param outputFolders           object    List of folders to write to.
#' @param climdexInputParams      object    climdexInputParams object capturing user supplied parameters for Climdex index calculations
#' @param indexCalculationStatus  character Status of index calculations (Not Started | In Progress | Done)
#' @param indexCalculationErrors  character An errors returned from index calculation.
#' @param sectorInputParams       object    List of sector correlation parameters
#'
#' @return  A stationWizardState object.
stationWizardState <- function(stationName = character(),
                                latitude = double(),
                                longitude = double(),
                                dataFile = NULL,
                                baseStart = integer(),
                                baseEnd = integer(),
                                isQCCompleted = FALSE,
                                qualityControlErrors = "",
                                indexCalculationStatus = "",
                                indexCalculationErrors = "",
                                correlationCalculationStatus = "",
                                correlationCalculationErrors = "",
                                climdexInput = NULL,
                                metadata = NULL,
                                outputFolders = NULL,
                                climdexInputParams = NULL,
                                sectorInputParams = NULL) {
  latitude <- as.double(latitude)
  longitude <- as.double(longitude)
  baseStart <- as.integer(baseStart)
  baseEnd <- as.integer(baseEnd)
  isQCCompleted <- as.logical(isQCCompleted)

  r <- new_stationWizardState(stationName, latitude, longitude,
                              dataFile, baseStart, baseEnd,
                              isQCCompleted, qualityControlErrors,
                              indexCalculationStatus, indexCalculationErrors,
                              correlationCalculationStatus, correlationCalculationErrors,
                              climdexInput, metadata, outputFolders,
                              climdexInputParams, sectorInputParams)

}