INCLUDE_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR})

ADD_LIBRARY (value
	Value.cc
	FloatValue.cc
	FormulaStream.cc
	LinkValue.cc
	RandomStream.cc
	StreamValue.cc
	StringValue.cc
	ValueFactory.cc
)

# Without this, parallel make will race and crap up the generated files.
ADD_DEPENDENCIES(value opencog_atom_types)

TARGET_LINK_LIBRARIES(value
	atom_types
	${COGUTIL_LIBRARY}
)

INSTALL (TARGETS value EXPORT AtomSpaceTargets
	DESTINATION "lib${LIB_DIR_SUFFIX}/opencog"
)

INSTALL (FILES
	FloatValue.h
	FormulaStream.h
	LinkValue.h
	Value.h
	RandomStream.h
	StreamValue.h
	StringValue.h
	ValueFactory.h
	DESTINATION "include/opencog/atoms/value"
)
