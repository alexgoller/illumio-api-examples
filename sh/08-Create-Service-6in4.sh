#!/bin/sh

# can be used to create services for IP protocols not in the official UI interface (e.g. SCTP, 6in4, etc)

curl --data '{ "name":"6in4","service_ports": [{ "proto":41}]}' \
     -X POST $ILO_SERVER:8443/api/v2/orgs/2/sec_policy/draft/services \
     -u $ILO_API_KEY:$ILO_API_TOKEN \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json'


#
# Internet protocols
#
# $FreeBSD$
#	from: @(#)protocols	5.1 (Berkeley) 4/17/89
#
# See also http://www.iana.org/assignments/protocol-numbers
#
#p	0	IP		# internet protocol, pseudo protocol number
#hopopt	0	HOPOPT		# hop-by-hop options for ipv6
#cmp	1	ICMP		# internet control message protocol
#gmp	2	IGMP		# internet group management protocol
#gp	3	GGP		# gateway-gateway protocol
#pencap	4	IP-ENCAP	# IP encapsulated in IP (officially ``IP'')
#t2	5	ST2		# ST2 datagram mode (RFC 1819) (officially ``ST'')
#cp	6	TCP		# transmission control protocol
#bt	7	CBT		# CBT, Tony Ballardie <A.Ballardie@cs.ucl.ac.uk>
#gp	8	EGP		# exterior gateway protocol
#gp	9	IGP		# any private interior gateway (Cisco: for IGRP)
#bn-rcc	10	BBN-RCC-MON	# BBN RCC Monitoring
#vp	11	NVP-II		# Network Voice Protocol
#up	12	PUP		# PARC universal packet protocol
#rgus	13	ARGUS		# ARGUS
#mcon	14	EMCON		# EMCON
#net	15	XNET		# Cross Net Debugger
#haos	16	CHAOS		# Chaos
#dp	17	UDP		# user datagram protocol
#ux	18	MUX		# Multiplexing protocol
#cn	19	DCN-MEAS	# DCN Measurement Subsystems
#mp	20	HMP		# host monitoring protocol
#rm	21	PRM		# packet radio measurement protocol
#ns-idp	22	XNS-IDP		# Xerox NS IDP
#runk-1	23	TRUNK-1		# Trunk-1
#runk-2	24	TRUNK-2		# Trunk-2
#eaf-1	25	LEAF-1		# Leaf-1
#eaf-2	26	LEAF-2		# Leaf-2
#dp	27	RDP		# "reliable datagram" protocol
#rtp	28	IRTP		# Internet Reliable Transaction Protocol
#so-tp4	29	ISO-TP4		# ISO Transport Protocol Class 4
#etblt	30	NETBLT		# Bulk Data Transfer Protocol
#fe-nsp	31	MFE-NSP		# MFE Network Services Protocol
#erit-inp	32	MERIT-INP	# MERIT Internodal Protocol
#ccp	33	DCCP		# Datagram Congestion Control Protocol
#pc	34	3PC		# Third Party Connect Protocol
#dpr	35	IDPR		# Inter-Domain Policy Routing Protocol
#tp	36	XTP		# Xpress Tranfer Protocol
#dp	37	DDP		# Datagram Delivery Protocol
#dpr-cmtp	38	IDPR-CMTP	# IDPR Control Message Transport Proto
#p++	39	TP++		# TP++ Transport Protocol
#l	40	IL		# IL Transport Protocol
#pv6	41	IPV6		# ipv6
#drp	42	SDRP		# Source Demand Routing Protocol
#pv6-route	43	IPV6-ROUTE	# routing header for ipv6
#pv6-frag	44	IPV6-FRAG	# fragment header for ipv6
#drp	45	IDRP		# Inter-Domain Routing Protocol
#svp	46	RSVP		# Resource ReSerVation Protocol
#re	47	GRE		# Generic Routing Encapsulation
#sr	48	DSR		# Dynamic Source Routing Protocol
#na	49	BNA		# BNA
#sp	50	ESP		# encapsulating security payload
#h	51	AH		# authentication header
#-nlsp	52	I-NLSP		# Integrated Net Layer Security TUBA
#wipe	53	SWIPE		# IP with Encryption
#arp	54	NARP		# NBMA Address Resolution Protocol
#obile	55	MOBILE		# IP Mobility
#lsp	56	TLSP		# Transport Layer Security Protocol
#kip	57	SKIP		# SKIP
#pv6-icmp	58	IPV6-ICMP	icmp6	# ICMP for IPv6
#pv6-nonxt	59	IPV6-NONXT	# no next header for ipv6
#pv6-opts	60	IPV6-OPTS	# destination options for ipv6
#	61			# any host internal protocol
#ftp	62	CFTP		# CFTP
#	63			# any local network
#at-expak	64	SAT-EXPAK	# SATNET and Backroom EXPAK
#ryptolan	65	KRYPTOLAN	# Kryptolan
#vd	66	RVD		# MIT Remote Virtual Disk Protocol
#ppc	67	IPPC		# Internet Pluribus Packet Core
#	68			# any distributed filesystem
#at-mon	69	SAT-MON		# SATNET Monitoring
#isa	70	VISA		# VISA Protocol
#pcv	71	IPCV		# Internet Packet Core Utility
#pnx	72	CPNX		# Computer Protocol Network Executive
#phb	73	CPHB		# Computer Protocol Heart Beat
#sn	74	WSN		# Wang Span Network
#vp	75	PVP		# Packet Video Protocol
#r-sat-mon	76	BR-SAT-MON	# Backroom SATNET Monitoring
#un-nd	77	SUN-ND		# SUN ND PROTOCOL-Temporary
#b-mon	78	WB-MON		# WIDEBAND Monitoring
#b-expak	79	WB-EXPAK	# WIDEBAND EXPAK
#so-ip	80	ISO-IP		# ISO Internet Protocol
#mtp	81	VMTP		# Versatile Message Transport
#ecure-vmtp	82	SECURE-VMTP	# SECURE-VMTP
#ines	83	VINES		# VINES
#tp	84	TTP		# TTP
#iptm	84	IPTM		# Protocol Internet Protocol Traffic
#sfnet-igp	85	NSFNET-IGP	# NSFNET-IGP
#gp	86	DGP		# Dissimilar Gateway Protocol
#cf	87	TCF		# TCF
#igrp	88	EIGRP		# Enhanced Interior Routing Protocol (Cisco)
#spf	89	OSPFIGP		# Open Shortest Path First IGP
#prite-rpc	90	Sprite-RPC	# Sprite RPC Protocol
#arp	91	LARP		# Locus Address Resolution Protocol
#tp	92	MTP		# Multicast Transport Protocol
#x.25	93	AX.25		# AX.25 Frames
#pip	94	IPIP		# Yet Another IP encapsulation
#icp	95	MICP		# Mobile Internetworking Control Pro.
#cc-sp	96	SCC-SP		# Semaphore Communications Sec. Pro.
#therip	97	ETHERIP		# Ethernet-within-IP Encapsulation
#ncap	98	ENCAP		# Yet Another IP encapsulation
#	99			# any private encryption scheme
#mtp	100	GMTP		# GMTP
#fmp	101	IFMP		# Ipsilon Flow Management Protocol
#nni	102	PNNI		# PNNI over IP
#im	103	PIM		# Protocol Independent Multicast
#ris	104	ARIS		# ARIS
#cps	105	SCPS		# SCPS
#nx	106	QNX		# QNX
#/n	107	A/N		# Active Networks
#pcomp	108	IPComp		# IP Payload Compression Protocol
#np	109	SNP		# Sitara Networks Protocol
#ompaq-peer	110	Compaq-Peer	# Compaq Peer Protocol
#px-in-ip	111	IPX-in-IP	# IPX in IP
#arp	112	CARP	vrrp		# Common Address Redundancy Protocol
#gm	113	PGM		# PGM Reliable Transport Protocol
#	114			# any 0-hop protocol
#2tp	115	L2TP		# Layer Two Tunneling Protocol
#dx	116	DDX		# D-II Data Exchange
#atp	117	IATP		# Interactive Agent Transfer Protocol
#tp	118	STP		# Schedule Transfer Protocol
#rp	119	SRP		# SpectraLink Radio Protocol
#ti	120	UTI		# UTI
#mp	121	SMP		# Simple Message Protocol
#m	122	SM		# SM
#tp	123	PTP		# Performance Transparency Protocol
#sis	124	ISIS		# ISIS over IPv4
#ire	125	FIRE
#rtp	126	CRTP		# Combat Radio Transport Protocol
#rudp	127	CRUDP		# Combat Radio User Datagram
#scopmce	128	SSCOPMCE
#plt	129	IPLT
#ps	130	SPS		# Secure Packet Shield
#ipe	131	PIPE		# Private IP Encapsulation within IP
#ctp	132	SCTP		# Stream Control Transmission Protocol
#c	133	FC		# Fibre Channel
#svp-e2e-ignore	134	RSVP-E2E-IGNORE	# Aggregation of RSVP for IP reservations
#obility-header	135	Mobility-Header	# Mobility Support in IPv6
#dplite	136	UDPLite		# The UDP-Lite Protocol
#pls-in-ip	137	MPLS-IN-IP	# Encapsulating MPLS in IP
#anet	138	MANET		# MANET Protocols (RFC5498)
#ip	139	HIP		# Host Identity Protocol (RFC5201)
#him6	140	SHIM6		# Shim6 Protocol (RFC5533)
#esp	141	WESP		# Wrapped Encapsulating Security Payload (RFC5840)
#ohc	142	ROHC		# Robust Header Compression (RFC5858)
#	138-254			# Unassigned
#fsync	240	PFSYNC		# PF Synchronization
#	253-254			# Use for experimentation and testing (RFC3692)
#	255			# Reserved
#ivert	258	DIVERT		# Divert pseudo-protocol [non IANA]
