
# Build the query-engine library
ADD_LIBRARY(query-engine
	DefaultPatternMatchCB.cc
	Implicator.cc
	InitiateSearchCB.cc
	PatternMatchEngine.cc
	PatternLinkRuntime.cc
	Recognizer.cc
	Satisfier.cc
)

# Optionally enable debug logging for the pattern matcher.
# TARGET_COMPILE_OPTIONS(query-engine PRIVATE -DQDEBUG=1)

ADD_DEPENDENCIES(query-engine
	opencog_atom_types
)

TARGET_LINK_LIBRARIES(query-engine
	execution
)

INSTALL (TARGETS query-engine
	EXPORT AtomSpaceTargets
	DESTINATION "lib${LIB_DIR_SUFFIX}/opencog")

INSTALL (FILES
	DefaultImplicator.h
	DefaultPatternMatchCB.h
	Implicator.h
	InitiateSearchCB.h
	PatternMatchCallback.h
	PatternMatchEngine.h
	Satisfier.h
	DESTINATION "include/opencog/query"
)
