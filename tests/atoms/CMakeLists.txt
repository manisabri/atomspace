
ADD_SUBDIRECTORY (atom_types)

ADD_SUBDIRECTORY (execution)

ADD_SUBDIRECTORY (base)

ADD_SUBDIRECTORY (core)

ADD_SUBDIRECTORY (truthvalue)

ADD_SUBDIRECTORY (value)

ADD_SUBDIRECTORY (reduct)

ADD_SUBDIRECTORY (flow)

ADD_SUBDIRECTORY (pattern)

IF(HAVE_GUILE)
	ADD_CXXTEST(HashUTest)
	TARGET_LINK_LIBRARIES(HashUTest smob atomspace)
	ADD_CXXTEST(FreeLinkUTest)
	TARGET_LINK_LIBRARIES(FreeLinkUTest smob atomspace)
	ADD_CXXTEST(ParallelUTest)
	TARGET_LINK_LIBRARIES(ParallelUTest clearbox execution smob atomspace)
	ADD_CXXTEST(RandomUTest)
	TARGET_LINK_LIBRARIES(RandomUTest clearbox execution smob atomspace)
ENDIF(HAVE_GUILE)

ADD_CXXTEST(AlphaConvertUTest)
TARGET_LINK_LIBRARIES(AlphaConvertUTest execution lambda atomspace)

ADD_CXXTEST(BetaReduceUTest)
TARGET_LINK_LIBRARIES(BetaReduceUTest atomspace)

ADD_CXXTEST(DefineLinkUTest)
TARGET_LINK_LIBRARIES(DefineLinkUTest atomspace)

ADD_CXXTEST(DeleteLinkUTest)
TARGET_LINK_LIBRARIES(DeleteLinkUTest execution atomspace)

ADD_CXXTEST(EqualLinkUTest)
TARGET_LINK_LIBRARIES(EqualLinkUTest execution atomspace)

ADD_CXXTEST(StateLinkUTest)
TARGET_LINK_LIBRARIES(StateLinkUTest execution atomspace)

ADD_CXXTEST(ExistsLinkUTest)
TARGET_LINK_LIBRARIES(ExistsLinkUTest execution atomspace)

ADD_CXXTEST(IdenticalLinkUTest)
TARGET_LINK_LIBRARIES(IdenticalLinkUTest execution atomspace)
