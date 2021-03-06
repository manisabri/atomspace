
# The atom_types.h file is written to the build directory
INCLUDE_DIRECTORIES( ${CMAKE_CURRENT_BINARY_DIR})

ADD_LIBRARY (atomflow
	SetTVLink.cc
	SetValueLink.cc
	TruthValueOfLink.cc
	ValueOfLink.cc
)

# Without this, parallel make will race and crap up the generated files.
ADD_DEPENDENCIES(atomflow opencog_atom_types)

TARGET_LINK_LIBRARIES(atomflow
	atomcore
	atombase
	${COGUTIL_LIBRARY}
)

INSTALL (TARGETS atomflow EXPORT AtomSpaceTargets
	DESTINATION "lib${LIB_DIR_SUFFIX}/opencog"
)

INSTALL (FILES
	SetTVLink.h
	SetValueLink.h
	TruthValueOfLink.h
	ValueOfLink.h
	DESTINATION "include/opencog/atoms/flow"
)
