#
# Find glm library.
#

message(STATUS "Looking for glm library")

find_path(GLM_INCLUDE_DIR
    NAMES glm/glm.hpp
    PATHS ${GLM_ROOT} ${GLM_ROOT}/include
    )

set(GLM_INCLUDE_DIRS ${GLM_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLM DEFAULT_MSG GLM_INCLUDE_DIR)

if(GLM_FOUND AND NOT glm::glm)
    message(STATUS "Looking for glm library - found")

    add_library(glm::glm INTERFACE IMPORTED)
    set_target_properties(glm::glm
        PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${GLM_INCLUDE_DIRS}"
            INTERFACE_COMPILE_DEFINITIONS "GLM_FORCE_RADIANS"
        )
else()
    message(STATUS "Looking for glm library - NOT FOUND")
endif()
