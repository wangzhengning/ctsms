/*
SQLyog Community Edition- MySQL GUI v5.21 Beta 1
Host - 5.5.27 : Database - ctsmsdb
*********************************************************************
Server version : 5.5.27
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ctsmsdb`;

USE `ctsmsdb`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'leave.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave\" name=\"è¯·å‡æµç¨‹\" isExecutable=\"true\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"deptLeader\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${leaveModifyProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"hr\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${leaveReportProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"283.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"190.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-24.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-22.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"283.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"217.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"299.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"280.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"300.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('3',1,'leave.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0<\0\0‘\0\0\0²4#\0\01¬IDATxœíİlœç}p:m&ˆa\rëbeHík÷‡‰f‰ˆ¥€ô×,§XÄ[B`AÌå…@DA»Ô†–ÙàhXã	Ãš©]j¨[¢¼q(ä¨“i²‰íj¶#Ë±•0¶Ó±2±•Ğ³dŸ%Jz÷Šç\\Ï÷ó9òî÷ÇçƒÂéx÷ò}Ÿ÷û~¿Ï—GŞ%\0\0\06{\0\0\0ºÑ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-=T«Õ………™™™İ»wW*•±²J=éééùùùµµµØ§…qÔ¸FòEÜÖˆ[ /4-İ=z4MèiU»ë®»î½ï¾§O:¿¾^Î‘{:GÙ»wo:\'iy‹}rÈ×ˆk$Ä­¸rGÓÒŞÚÚÚììì={{ş¹óëçÆñâK/¦å-œÕÕÕØ\'Šh\\#®‘<·âÈ)MKiU›œœüÊá/Ÿ_?gt\Z÷|í;w®¬¬Ä>]Dà\Zqä‘¸·@~iZÚ˜İ¨j¯İÇ½÷}ãæ›ÿaìÓE®×H‰[qä—¦¥ÙÑ£G÷ìùàú…ª2~çwÿÕwü^ì“ÆH¹F\\#y$nÅ-kš–7©V«•JåùVÖ/¼f„Œ3g¾cÇû–——cŸ:FÄ5â\ZÉ#q+n¼Ó´¼Éüüüìììú…Wëã–©øÆ‘Ï*Õ¸ã777ûÔ1\"®×H‰[qä¦åM¦§§Üı¿ş¦ª}pÏ_\'É³“§Ö“ïK;—<ræÂÁ»¿ùç/¼üĞùäÿV“‡ªÉı¯&ßx=ùÃûÿÔ¾OG¯1QÆw›œœŒ}ê†«öC>Ä qñ\Z)Cx‹ÛâÅ-P6š–7™˜˜8yòÑõgkcllìL’œ½”¼|!ùÙùäÕ$ù—ÿúócoyÇ®N¿°<w.yîõd¥š<}!ùÓ¿zlãrgK8Îœ==>>ûÔ\rQº˜»ùæ›¿røğîİ»‹½°á\Z)Ø5R’ğ·‹[ „Ğ´T«ÕÅÅÅıû÷OOOïş…©©©ô………|UÁmÛ¶½tú…õgj#­U¯^LÎ]¼ü¥—.ÿûg_ÿ?÷ïııó…ß¿$¯\\H^^O~¶¤Gø‡¿»QØÎ”s¤Ç÷Ä\rOmI÷ÈwŸ_¿ş[ì…]×H‘®‘ò„·¸-RÜå´¥|”ö*is2>>¶+i‹räÈİ÷Ş÷ÍÚ¸çk_¿ıöÏÏÌÌ¤¥b×®]yùİâôJ}¤ÿ={!9ıZrşâH+úúÒÿŞüÒs?¾üÙ[ë—’óïÁï<ÖôÜR¢¶Æ%]mddaqÂ]#…¹F²Ş#˜q[˜¸Jk“ùèÄ‰imK{•´9©¼NãşÜ»÷ã“““KKKİùÁÛ(Nÿ¯>.¶‹É‹¯&?9“¬\'Éùsç&nºilìÊ±±ñüó½O|äø£MÏ-Õ(dak]Ò\roa×ıï€{>f€{²«®‘\\#C\rïÆ³¸-FÜe¶™|tàÀ´¹÷¾oölWšjaZ#÷íÛW­V~ƒ²Qœ^®±_!8ıZòãW’Ÿ¾<rò‡×_ı•o½úm×ıÒÌÇŞTØşÎñ¦ç–j¯°uZÒ\r©oé2M_jüo”iwà\Zvxg0Åmâ(¹şòQÚoÌÌÌÌÍÍõÕ®4?ºóÎ´®®®éx¶h£8­ÕGúß×.%?«^şiÜ‹¯\'÷=¼üŞïÿ¥¿óÎë¶ı­?şoúz’œ9—¼zîòï?öpÓsK5\nVØº/é†Ñ·Ô&°íœ;}i?œî´«®‘\\_##ïÆ³¸Í{Üô‘Òe×®]›îXê¿-–ngeeehµyi‚¾páçõQË×im{y=ùùùäÇ¯¬?øøÊğë·ü£üÓsÉOªÉO«ÉésIZÚîèá¦ç–j©°…,éŞ·şdºõa£Ÿy×H®¯‘Ñ„wãYÜæ:n’¾š–™™™­w,õr˜ö-ü=±¦â´û–›¿ûı§y|ùØ‰å/?ğè“~÷Ô_<ô½¿zü™oòÛÇğÀ£?8öØ“?õ£;ÿËáŞúÑèFaÛ¢ğ%İ`û–?™®?,âk,õ}päô\ZYxg0Åm~ã &48p`+¿Ö:¹{zzz¨Ç¶	…ígã7óÓƒ¡Á?ûÈGšXªQŒÂÖï’n€}Këz®í£üÉt\'®‘œ^#£ïÆ³¸ÍiÜÔå£\'NLNN°c©O}êÓ‡\Zööe£°6ú(l›[Ò\rªo	_äµÚô7İô®F·<¸×ÈˆÃ;ƒñ,nó·\0‚òQÚ±l®ÚuÏ=ÿÂ7V2õKb—ÛÅ—Œ~GŞ[ë’î¯}ı¦›&>uªmè¾øÒé;v|åğáAõ-õõ\\ë®íÜFœp×Hî®‘Ñ‡wãYÜæ.nšôÎG‹‹‹ÓÓÓïXjã³Ÿıíƒà8m¶~G®[Û%İøøxzPiSİº°«-éj‹°Aõ-]&°ş¥¦5_ëÑpäë\Z‰ŞŒgq›¯¸hÕ;¥…ªßdéëÅ–íÛ·à8m¶Ÿ\Zıü¶.Kºš¦…]ã’n€}Ë&y]î*×H®‘XáÁx·9Š[€¶zä£´>mÛ¶mHKmìÜ¹óØ±c£9Ú6\nÛOŒ~GN[ë’î•3gÓ.ºéwZê»Ö%]*]¦½÷û–N¿3Óö—jšv ÓÓ‡Ä5’—k$bxg0Åm^â “ùh~~~vvv¨MËî¸cnnn4G[³°°ĞéSb6\nÛªÑïÈZaërŠë:ıirzOÚ¨·.ì?úhÛ%İ=_ûzëø¹“Q¸F²|ïNÄm–ã`‹zä£}ûö:th¨MË½÷}3-£9ÚÔ“O>Y«Ç×^{í‘#Gš¾ª° °u?Å5İßL©íÂîê«¯YÒea×“k$Ë×ˆğîDÜf9n¶®G>šššêT·5>uêÆ+£9ÚTµZ}Ë[ŞR«mW]uÕ{ŞóÆŸÌm¶¿6ú™*lİOqöö¯mvKº,/ìB¸F²|ïNÄm–ã`ëzä£!½ÙqãxåÌÙ´@æhkš~«ûmo{Û\'>ñ‰Ú;/§ÿ½xñÇF¿#k…­Ë)ÿÀŠ.»KºÌ.ì¹F²|ïNÄm–ã`‹zä£´4şæFšÓâ×åÇ~£tñâF¿c,Kg°»tIşnx±ô—W^yeÓ®¸âŠÃ‡ÿ$pµß~ÌËäŠoyc#¹F„wÑc cLÓdF|411ñÄÉ“#hZFs´5×]w]½ŒMoH‹îòòròÆOã7úY+l]Nñ‰\'Ò…İ‹/î–mßL©¦í\\´İBú}Óï{>úæ\ZÉò5\"¼;·Y[€-ê‘†ú!-µ1â¿iY[[«•´´ûä\'?™ş»°°PÿêFa{n£ûë_íğó¿ tzzÓFBöªq¿uÏÙì©û)NÂv]–t».é\ré\ZÔÕ´õÇ<şGyïN¢Çmx¶İ™ˆ{8‚¸Øºùhvv¶ñÃÅ†1îàÁ;wæhSÏ>ûìøøøÔÔT¥R™››kú…ì²ñ£¾FKóğ£¦ÿÖÖéén·n§çFº¬BÚn§ç–Ã\'adg°§î§¸¦ûÂ®í’îŠ+®_ØepInà×È&Â©ç…Ö6¶cÅÿ(¯áİIô¸írêëñÙ%ğºs¬=`Ül]|tğàÁÏ~ö·‡Ú´¤MÑŞ½ÉÁ¾aqqq~~¾íÛù¤<ôµjzpÓSZÿ¸\ZÜ±A­Ş²VØºœâºN»N±÷‡ÿùKm?à¢ua—Í%]_†}^}ÅpÄøñ5\"¼;‰·!ÁÜ˜ç[C7¤\nŒ~ÿG~\ZÚë‘Òì_©T†Ú´ìÙ³çèÑ££9Ú6ÊÃ³}Æ§Ôn×ïi½Ñéé­iû¬~w¯íãúœşvµû7Š}ê6£ua×iIW{3¥NÌ×¸°Ëò’n 6![Û¦èm=ş³yïF#ˆÛ­Dxc@6}5îç4·…Ô;\rõoñ_9s6-“µ·¤Ì‚ËåáÒJ¿£ö¬ús›şÛt»ís›n·Y–o§íª®q#Ü}û=g ö©Û¤Ö…İŞ½o»¤«Ö…]Úu§aœ÷%]¸MI¿Ôæ%ş3{ïºÄm÷€ìœõû»<8ÊGŒ[€¶zç£¡ş†Øïñ‹éÆGpœ6ÊÃ3á£óòè™ÆMuÙlÓ—êÿíôôNß1ä‰]¾Kã61r]Øº,ìÚ~`EãÂ®0Kºp[‰“ÀXêtÉôşXñŸåkDx×ûüöé¶Qİô¥ˆ;™µ¸hÕ;U«ÕJ¥2ŒOkIËá7VVWWGpœ6jÆ·8êi½ÑéÁ-+°¶şşİ;/ìŞô˜À=ü¦±Oİ–´]Øuùˆ½ÚÂ®HKºp¹Fz^>=¿KS<ÇÿŒ_#Â;~Ü†Äj—°l*Mµçqã IP>ZXXøè­·şe–äÂvª¯ÑRNÕ7Òz£íÓÛŞÓúoà\ZÿÛöv}?÷0pbŸº­j]ØuÿXñ\'N,Ò’.ÜC¥g u	ìî\"Æö¯á=‚SÜé¼·–†¶aÙ%b£ìyâ Qh>úĞ‡?|äÈİìXÒ¢¸cÇ´.õğúµQîk4>¥v»~OëîOo}JÓ¿½mOwX§ïÒ}\'!ö©€ğækÅXÒ…Ûb¨ô{5õûÈ(ñŸ‹k¤äá=‚SÜ3V»çíÆŒ88³·\0u¡ùhmmmçÎƒú‹üÚ›Ø<}êÔPm6ÊÃS}Æ§Ôn76éôôús;m<ğNß·ííÆî¹«İ\'!ö©Œ~v…YÒ…Û\\„ô{)uŠíÎ\rIÌøÏË5RæğŞ™\rì.Ş)ÿGÜíìÄ-@Mùhyy9í[ºLr`!üĞ‡?|Ï×¾>¼£Ú´Í5-M‹§N£í—Ú¶}u)ß·±R6}—’7-I?»\"-éÂ\riÕ3VÃ¯©ÑÇ®‘Ò†wÜ¦¥g2o}@§§Œ~çcŸ:€7ô—Ò¶cÇûxpÓË\'O¦O6;–d£°]ºôd_£ñ)µÛ­i»ÙzŸÓö‘­›\rÜBà÷mû]ºo­û$Ä>uƒ²°+Ø’.Üæ\"$ü\"\nùj` ,şóu”3¼‡wfÃã°5Û7}©¯ü?²}ê\0ŞĞw>Z[[KŞí·¾ßß~åÌÙßÿâk¿c6Œ#ˆòğ£ßQ¼ÂÖ}aW¼%]8×H®‘†·¸-@Ü%·™|T­VÓ¦å¦›&Ò&¤ş3İÇWNÿÙÏşvZ~´QØ–~G![§…]!—tá\\#Å¸FÊŞâ¶q”ÙæóÑêêêm·İ¶mÛ¶}øÃiOÒúšé=wİõ?>zë­écöîıøÊÊÊàv{X6\nÛ÷~GQ[ëÂ®¨Kºp®‘Â\\#¥\noq[˜¸Jk«ù¨Z­...ÎÎÎîØ±cìÍÒ{Òeaaammm û:ããã¯½öè¥Kß3ú\Z.l»/éÂ¹FŠt”\'¼Åm‘â(\'ùèM*•Ê3Ïüù¥K\'¾F±[ma÷ô©S^Ò…sì\Z)Ix‹Û‚Å-PBòÑ›LMMıï£‡.%OáãûË611ûÔ\rWº˜K=^Ò…sï\ZùĞ‡>Tøğ·Å‹[ l4-oràÀ¹¹OD/ù\Z2ÿ…ÙÙÙØ§nèÊpŒ!\\#Å»FÊğÓtq[¼¸Ê¦øµª/+++¿òZõ‘KÉãFà˜şÀââbìS7teXØ…pï\Z)Cl‹ÛâÅ-P6Å¯UıÚÙ¾KÉwñ?şÃÌÌTì“6\neXØrì\Z)Il‹Û‚Å-P6¥¨U}©V«»wÿú±cÿ=I3ºÕÕû&&~emíşØ\'mJ²°á\Z)Ø5R’Ø·‹[ lJQ«úµ¼¼<9yÓòòb’œ0:´ª¥+€¥¥/Ç>]#R’…] ×H‘®‘òÄ¶¸-RÜeS–ZÕ¯cÇ¥µíÀ‘$\Z­cqñ‹•¥¥ÿ\ZûDNyv\\#…¹FJÛâ¶0q”M‰jU¿ªÕêÜÜìîİïŸŸÿ·««ßH’ãÆÚÚ_.,üû™™=ÓÓ»ÓÛ±OÑH•jaÈ5RŒk¤l±-n‹·@Ù”«VmÂÒÒÒìì?İ¾ıo16¶mÛµ33Lk[ìÓÁXÉvá\\#òxŒ•2¶Åm£<Æ-P6e¬U9åıòã\Z+åÂ2ÛqÉí\0!Ôª|xè¡‡Ò…ÅÚÚZì)/;ŠJlÇeşBÈ•ùpÃ\r7¤…í·~ë·bïHyYXPTb;.óB®Ì?øƒ?¨ıÚñ»Şõ®\'NÄŞ’²° ¨Äv\\æ „\\™ukkkãããµ¦åê«¯~ÿûß{JÊÂ‚¢Ûq™€reÖMOO7¾ÇË\r7Ü0??{§ÊÈÂ‚¢Ûq™€re¦­­­µ¾7å»ßıîjµ\Z{×JÇÂ‚¢Ûq™€re¦}ùË_®5*ï}ï{ëMË¯ıÚ¯---ÅŞµÒ±° ¨Äv\\æ „\\™ißşö·ßñwT*•mÛ¶¥…mû†w¾óš–Ñ³° ¨Äv\\æ „\\™u\'NœXYYI~QØÒÛŞ@,\nŠJlÇeşBÈ•¹¡°Åeş)*±—ù!Wæ†Â—ù§¨Äv\\æ „\\™\n[\\æŸ¢Ûq™€ren(lq™ŠJlÇeşBÈ•¹¡°Åeş)*±—ù!Wæ†Â—ù§¨Äv\\æ „\\™\n[\\æŸ¢Ûq™€ren(lq™ŠJlÇeşBÈ•¹¡°Åeş)*±—ù!Wæ†Â—ù§¨Äv\\æ „\\™\n[\\æŸ¢Ûq™€ren(lq™ŠJlÇeşBÈ•¹¡°Åeş)*±—ù!Wæ†Â—ù§¨Äv\\æ „\\™\n[\\QæßIg„Y\\æ „\\™\n[\\İç¬—‡õ|ÌĞ’RZq™€ren(lqõ;ÿmße#M_jü¯SÏP	°¸Ì?@¹27¶¸Ø´´}	¥Ó—¼ØÂ°‰«¸Ì?@¹27¶¸úšÿN|¥¥õaÎ>Ã#ºâ2ÿ\0!äÊÜPØâ\nŸÿ¦OZ7Òå•–Æ-x…Ñ]q™€ren(lqÎSÒö/UzŞé•FItÅeşBÈ•¹¡°Å2ÿm{•ÖÛ!M‹WZÑ—ù!Wæ†ÂW÷ùoê+Ú¶%ICÒı×Ã¿)„0‹Ëü„+sCa‹kdˆßéÌ\0C\"´â2ÿ\0!äÊÜPØâŠÕ´t¹B\\ÅeşBÈ•¹¡°Å5¼¦%ğ=Äúİ$®â2ÿ\0!äÊÜPØâ2ÿ•ØËü„+sCa‹ËüSTb;.óB®Ì\r…-.óOQ‰í¸Ì?@¹27¶¸Ì?E%¶ã2ÿ\0!äÊÜPØâ2ÿ•ØËü„+sCa‹ËüSTb;.óB®Ì\r…-.óOQ‰í¸Ì?@¹27¶¸Ì?E%¶ã2ÿ\0!äÊÜPØâ2ÿ•ØËü„+sCa‹ËüSTb;.óB®Ì\r…môÒiŸœœLolß¾=ı÷íoûòòrì]ƒ‘[â2ÿ\0!äÊÜPØFï«_ıêX‹[n¹eqq1ö®ÁÀÈ-q™€ren(l£W­V¯¹æšÆå}ï{ßöíÛ×ÖÖbï\ZŒÜ—ù!Wæ†ÂÅç>÷¹·¾õ­õ¦å3ŸùÌÜÜ\\ì‚A’[â2ÿ\0!äÊÜPØb¹şúëkË­·ŞZ©TªÕjì=‚A’[â2ÿ\0!äÊÜPØbùÖ·¾uÕUW¥ó?55å¯Y(¹%.óB®Ì\r…-¢|àµ¦%öÀàÉ-q™€ren(l­®®¦óï)$¹%.óB®Ì\r…-.óOQ‰í¸Ì?@¹27ÊYØªÕêÂÂÂÌÌÌîİ»+•Jë§¦”DzìéLOOÏÏÏ{Ãek¬”¹%;Ì?@¹27JXØ=š.ÖÓå®»îº÷¾û>uêüúz9Gzìé9rdïŞ½éœ¤­Kì“Cq”0·dŠù!WæF©\nÛÚÚÚììì={{ş¹óëçÆñâK/¦­K:9«««±OEPªÜ’Aæ „\\™å)liÇ299ù•Ã_>¿~Îè4îùÚ=;wî\\YY‰}ºÈ½òä–l2ÿ\0!äÊÜ(Oa›İèX^7º{ïûÆÍ7ÿÃØ§‹Ü+OnÉ&óB®Ì’¶£GîÙóÁõU#düÎïş«;îø½Ø\'|+InÉ,óB®Ì2¶jµZ©TaeıÂkFÈ8söç;v¼ÏÈ°eÈ-YfşBÈ•¹Q†Â6???;;»~áÕú¸eêŸ¾)pã³J5î¸ãßÍÍÍÅ>uäXrK–™€ren”¡°MOO¹ûıMÇòÁ=$Ï^LZO¾w.yì\\òÈ™ïşæŸ¿ğòCç“ÿ[Mª&÷¿š|ãõäïüSû>½ˆ2¾süØäädìSG•!·d™ù!WæF\nÛÄÄÄÉ“®_8[é!ŸI’³—’—/$?;Ÿ¼š$ÿò_~ì-ïØõÁéÖ“çÎ%Ï½¬T“§/$úWm¼Ør¶„ãÌÙÓããã±O9V†Ü’eæ „\\™e(lÛ¶m{éôëÎÔFzÈ¯^LÎ]¼ü¥—.ÿûg_ÿ?÷ïııó…ß¿$¯\\H^^O~¶¬%É7şîFÓr¦œ£±ÁğˆŸ¸Ì?@¹27ÊPØ6\ZWê#ıïÙÉé×’óßxÀÚÚÚúÒÿŞüÒs?¾ü¹Šë—’óÍÌƒßy¬é¹¥\Zeˆ\r†GüÄeşBÈ•¹Q†Â¶Ñxü¿ú¸Ü´\\L^|5ùÉ™d=IÎŸ;7qÓMccWäŸïm|â#Çmzn©Fbƒá?q™€ren”¡°m4/×Gí×ÃN¿–üø•ä§¯\'œüáõ×_å[¯~Ûu¿4ó±75-çxÓsK5Êø‰Ëü„+s£…m£ñX«ô¿¯]J~V½üJË‹¯\'÷=¼üŞïÿ¥¿óÎë¶ı­?şoúz’œ9—¼zîòï?öpÓsK5ÊÉêêêöíÛcïE©¹~BÈ•¹Q†Â–ã…?¯Ú!§}ËËëÉÏÏ\'?~eıÁÇWvüƒ_¿åıãŸK~RM~ZMNŸKÒ¶åş‡nzn©Fbƒ!YYY©T*±÷¢Ô\\¿\0!äÊÜ(Cakj<vßrów¿ÿÔ#/;±üÀñå}òÁïú‹‡¾÷W?ó­ãO~ûøxôÇ{òñ§~tç9üÑ[?\Z½yĞ´;GššŠ½¥æú!WæF\nÛFÓò³Æñ›¿ùé±\0ÿì#izb©Fbƒ!Ù¿!ö^”šë „\\™e(lMËi£ßQ†Ø`H¦¦¦=\Z{/JÍõB®Ì2¶ËMËÅ—Œ~GbƒaX]]­T*Õj5ö”šë „\\™e(lMË‹F¿£±Á0<xğ¶Ûn‹½eçú!WæF\nÛFÓòS£ßQ†Ø`àªÕj¥RY]]½#eçú!WæF\nÛFÓò£ßQ†Ø`àfggçççcï¥Èí\0[\'WæF\nÛFÓ²jô;:ÅÆÂÂÂÊÊÊhÏ!ùpğàÁ}ûöÅŞ.+CnØ:¹27ÊPØ4-iZÖÖÖ>ö±ÕŞú]ïz—¾…FÕjuvvVÇ’eÈí\0[\'WæF\nÛFÓò×F¿£16:4>>^ëXÒÛ·o÷GÔ¤İìÁƒ+•Šß\nË”2äv€­“+s£…-=Æ‹lô;j±±¼¼ü«¿ú«Ÿ¹¹k×®t…\Zû¬ÙÒÒÒ¦§§Ó`¸í¶Û4±YS†Ü°uren”¡°m4-/ıtŞvïŞ=í¤±177·¸¸¸¶¶û§±äv€­“+s£…mìrÓò¼Ñï¨ÅÆÊÊÊoüÆoüò/ÿr}µzíµ×NNNÆ>«DV†Ô‘kN@¹27ÊPØ6š–ç;\Z·ÙöçĞ]¸Ù.wãˆÚ~ßú=zôÆo|÷»ß];ºk®¹ÆççEÏ×LBÖó1ñöœ€ren”¡°m,ñ4ğQßlëök÷´ëd~ÔôßNÛÜ`§íê\0§1íRöïßÃ\r7LNN¦ÿ8q\"Ö	e‹Ú^õ]RAÓ—\Zÿ[†’SN\r@¹27ÊPØ†·¬ïÔ½4İhl9Z›“.?½îù‡}\\­“¹²²2??¿¸¸8úóÈ tiZÚ¾„ÒéK­$;œ€ren”¡°m,ñŸŞ¨m¿¡Óx¶ş[šg›x»ñÎÖmï¸bŸ:¯ÓiírºÇº¾´\"N²Éy!WæF\nÛå•ı¥•Á7\Z†_Üît£şÈ¦{š6ÕıvÓÓ[·0¤Q†Ø(›¦Oš¾”t}¥¥q­!kœ€ren”¡°m,ñŸø¨o¶í2®ñ1şíòôÆ4>«ûÃ~€±OƒÔÔ4ß¶ÍLÛ¦¥ífÉ\Zç „\\™e(lËú|Ô7ÛºıÚ=­h|d÷;CÜö[ö\0cŸ:¦m¯Òz;¤ii5Ô=gsœ€ren”¡°m¬ìO\r|Ô7[»ÑğºGó=_!yÓvBnwÚÈ0ö©c\0šúŠ¶mIÒĞŸ´6$m#AxdœB®Ì2¶•ıÓõÍÖn´şÛéñ­÷wîjÚ¯ÛÔÆ>u^§ÓÚåt·66mï\'Sœ€ren”¡°m¬ìŸ\ZøøE_ñTıß¦{êk||ãÃšr»]c3øC«¯Ø§Á`ÓÒåN¢sF\0BÈ•¹Q†Â6¼¦¥µ»èŞo„o³{ƒÔóñš:é«i©÷ÆMhêœ»l–Xœ€ren”¡°¥ÇxéÒ“C\ZM¯/ã\ZowÒsk­÷7> ÓFxh±O°I®_€ren”¡°m¬ì`ô;ÊPT®_€ren”¡°m4-ËF¿£±Eåú!WæF\nÛFÓò}£ßQ†Ø€¢rı„+s£…m||üµ×½té{F_£±Eåú!WæF\n[¥Ryæ™?¿té¤Ñ×(Cl@Q¹~BÈ•¹Q†Â655õ¿º”<a„ï/ÿÙÄÄDìSlRr;ÀÖÉ•¹Q†ÂvàÀ¹¹ODoò5şdş³³³±O°IeÈí\0[\'WæF\nÛÊÊÊÄÄ¯¼V}äRò¸8¦§?°¸¸ûÔ›T†Ü°uren”¤°í¿lß¥ä»FÈøŸÿaff*öI6¯$¹`‹äÊÜ(Ia«V«»wÿú±cÿ=I3ºÕÕû&&~emíşØ\'\rØ¼’äv€-’+s£<…myyyrò¦ååÅ$9at\ZiÇ’vwKK_}º€-)OnØ\n¹27JUØ;–ö-ü‹$yÔh‹‹_œ˜¨,-ı×Ø\'\nØªRåv€M“+s£l…­Z­ÎÍÍîŞışùù»ºú$9n¬­ıåÂÂ¿Ÿ™Ù3=½;½ûP¶Ü°9ren”³°---ÍÎşÓíÛÿöccÛ¶];3óÁ´o‰}Z€+enè—\\™\n[\\>¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™\n[\\æ¹ „\\™ı¶±!›ÚÊE-ºé¡ONN¦7¶oßşûö·¿}yy9ö®QÔü	0Xrenô,lcoø˜ïrÿX}U¶}õ«_m=º[n¹eqq1ö®Q¤œ	0<renôUØÂÜöe“~»‘¢İjµzÍ5×4ÎÀûŞ÷¾íÛ·¯­­ÅŞ5 Ç¼ŠĞ¯b®5©{cĞ¥Óhì7\Z7Rµ¤Ë7êt»Ë÷íÿÈ2ísŸûÜ[ßúÖúÑ}æ3Ÿ™››‹½S@¾y _E[bXÏ~ °ÙhêUB\Z›¦Û­ÍIñz•F×_}ío½õÖJ¥R­Vcïo^ÅèW‘×šÒ´ô|™¥õşÖ×[zn§ñYİVßúÖ·®ºêªô¸¦¦¦ü¯âô¥hëËiZzŞîôÕç¶½]’—\\>ğÔš–Ø;‡WqÂs‰YH[¥¥õ1É š–b¿ÌR³ººšš¿‘È«¸\0áŠ¹Ä,¤¾úîîùJKHóÓöµiI\n}h@,^Åd–ƒz¥¥Ë¿­ßÈ+-5kkk³³³şF,¯â*æ³¶şJKëË#^0éùM›~»ls;™i¯róÍ7åğáİ»wë[€Á*dÚ8¹27zşÆWwML:¿ŠòMÛv;…|¥¥Ö±<òãç×/¤ÿê[€-ªV«‹‹‹û÷ïŸŞıSSSé=óóó«««±w ‹Š¶Ä,°ññqï-3bKmè[€MK{•´Qéù3¦ÉÉÉC‡Iø\04-¹Q©TVVVbïE‰´v,ú`s–––víÚÕ³]i”æ|o)P§iÉÉÉÉ\'NÄŞ‹²èÔ±è[€¾T«ÕÙÙÙÖ×R~çw~÷È‘»ï½ï›õqûíŸß³gOÓ#§§§¥\Z€DÓ’#é*yii)ö^”B÷EßZ]]mzå³Ÿıí§Oê’[^|éôİyçöíÛ_rñ+\0MKnÌÎÎÎÏÏÇŞ‹âéXô-@O+++i¿Qï=¦¦¦º·+M­Ëí·¾şÜñññcÇÅ> €˜4-¹‘v,iß{/\n.¼cÑ·\0]T«ÕÆ×X¾pÇY¥qÜu×ÿHÛ•úë-ŞX(3MKn,//OLLÄŞ‹\"ë·cÑ·\0ÌÌÌÔ;–#GîŞDÇRÏ0Û¶m«m\'M5± \ZMKø[üáÙ\\Ç¢oZ-..nñ5–ÆqÏ×¾^ßÚÁƒc@š–<IËÕm·İ{/\n¨µcIW	7İ4ÑéĞ_|éô;¾rø°¾h599Yÿ;–-v,µQÿû–íÛ·ûü œ4-y’Ö*¿Ö<pm;–Úï‘ßxc¥µo©u,µ„¾h²°°Pÿëùça MË+gÎÖßOÌ®€rÒ´äÌÒÒ’_k .KMSßÒØ±è[€Vi¨¿»ñ@:–ÚHSMm³Û¶m‹}ˆ\0hZògÿşı~Ò6­Kã3[û–Ö¥õ‡©ú(³ôÚ¯\'‡A½ÌRi.ªmÙgv%¤iÉ¥¹¹¹©©)+ã­èô—÷ïÕÓØ·ôÑ¶Ë=_ûzëô-P`+++m¿4??_KilÇ’O}êÓµ§%`´GŸ¦%¯=Z©TöïßïO\\6¡û{…µí[®¾úêEßÅöä“OÖ2Àµ×^{äÈ‘¦¯îÛ·¯öÕ­¿iXë¸÷¾oÖ6¾k×®(Ç‘¦%ÇÒ5qÚ´¤­ËÔÔTzÃ/\nywã¶}K`Ç¢o«V«oyË[jyàª«®zÏ{ŞÓøªKšk_ê67>uª¶ñ4íÇ›\0€84-¹—VĞ£G¦MKı¯?é\"üóXºô-=;}XÓ_¾½ímoûÄ\'>Q{\'âú›oîCŸzú7=\0£&ñQ.iÇrï}ß\\üÅÒ_^yå•MËW\\qøğŸ„ÿ:Çî\rƒl¼€¬ª÷3>åi‹£¾ıØ©`Ô$>ÊåÄ‰ißòâK§{.Ú¾WXMÛÏoi»…´]I¿cìƒ&£š–İW¢ëÔ.«}©)˜Ãö”7¹îºëê8½!½Ò———Ó/MLLÔîâäÉa4-õ7d=\0£&ñQ:!}K—%°oÑ±ĞS÷¦¥çõ[ŸÒ};­_µöİ„ú›\Z§ıÉ\'?ùÉôß………úWë/«†¿¢>Ò¬RÛ¸jJHÅ¢Œº÷-m;–+®¸\"¼oÑ±ĞScÑ¶!éôø¶÷wilZ¿]ÏmÒÅ³Ï>;>>>55U©Tæææšşhmvv¶6ótçoZ8y²¶ñÉÉÉX‡‹ŠEIuê[:}‚äşç/µıü–Ö¾EÇBO-D§V¤{Óó;öÜİ-..ÎÏÏ·ı¨–Ô&vïŞ¼iùÂwÔ6>333òƒˆLÅ¢¼Zû–NKí½Â:}îdcß¢c!DÛ¡mÓÒóv§;Ûv)[ÜmzZ^^®Muš+^9sv°MKš¯jO[¦Ø\n0jj¥ÖÚ·ìİûñ¶Km´ö-{öì©/Mt,ô¥ç«=owÚB—Muz\0ƒR©Tjs{äÈİìXêÒ2¶ñÖí±`ÔT,Ê®KßÒöóX\Zû›Ò0tjE:53¾E_Ïb‹æææj³½cÇ¾Øò¡¸¶ÙéééØ‡ºíû–.Ÿ Yë[t,lZSûÑóÕFê›JÚıªXÓıš–áY[[«šÊî¸c Ëı<Xy(\'u.kí[º õ\'OêX”î¯téFBÖÚ®toØºƒÖ_­İú{?}êT½Ú·o_ìƒˆCÅ‚7„îdãĞ±°i­/€$í^$ét£íıİ[—NÿeàvíÚU;¿i¿òY´Æ+gÎÖß$İÔêêjì#ˆCİ‚¿Ñoß¢casZÿÂ¤õÕÖÇ´>½SK£i‰nee¥şÇoi³Ñı•ÛNã¹ç_¨w,ãããKKK± \ZuŞ$¼oÑ±0(İ=¬ûıŞ¶çkg‹;O\'iQŸä´åè÷ã&ïàÁúo…¥<û€\0bR® YHß¢czZ\\\\l|“ô;vtz{¦X>zë­¥@Ómtï[t,@ ååå‰‰‰Æ$m]n¿ıóOœ<ÙÚ«üÑwîÙ³§ñÁiÏã·Â\0MtÒ©oÑ±\0}Y[[Û¿ÿøøxÛ_ÏÛ¹sg§/ÍÌÌøË{€\ZMtÔÚ·èX€ÍIÛÙÙÙ¶ÍI«4Ï;v,ö.dˆ¦ºiì[t,ÀU«Õ………´{™œœljT*•Êôôô¡C‡¼ºĞJÓ=Ôú–§OÒ±\0\0D¡iŞÒ^¥R©èX\0\0¢Ğ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™¦i\0\02MÓ\0\0dš¦\0\0È4M\0\0iš\0\0 Ó4-\0\0@¦iZ\0\0€LÓ´\0\0\0™öÿm&G¼Î]@\0\0\0\0IEND®B`‚',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','101',2),('schema.history','create(5.12)',1),('schema.version','5.12',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('24','leave:1:4','20','20','startevent1',NULL,NULL,'Start','startEvent',NULL,'2013-06-26 17:20:49','2013-06-26 17:20:50',9),('25','leave:1:4','20','20','deptLeaderAudit','26',NULL,'éƒ¨é—¨é¢†å¯¼å®¡æ‰¹','userTask','2','2013-06-26 17:20:50','2013-06-26 17:21:04',14663),('30','leave:1:4','20','20','exclusivegateway5',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2013-06-26 17:21:04','2013-06-26 17:21:04',0),('31','leave:1:4','20','20','hrAudit','32',NULL,'äººäº‹å®¡æ‰¹','userTask',NULL,'2013-06-26 17:21:04',NULL,NULL);

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('22','VariableUpdate','20','20',NULL,NULL,'applyUserId','string',0,'2013-06-26 17:20:49',NULL,NULL,NULL,'2',NULL),('29','VariableUpdate','20','20',NULL,'25','deptLeaderPass','boolean',0,'2013-06-26 17:21:04',NULL,NULL,1,NULL,NULL);

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  UNIQUE KEY `ACT_UNIQ_HI_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('20','20','1','leave:1:4','2013-06-26 17:20:49',NULL,NULL,'2','startevent1',NULL,NULL,NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('26','leave:1:4','deptLeaderAudit','20','20','éƒ¨é—¨é¢†å¯¼å®¡æ‰¹',NULL,NULL,NULL,'2','2013-06-26 17:20:50','2013-06-26 17:20:58','2013-06-26 17:21:04',14661,'completed',50,NULL,NULL),('32','leave:1:4','hrAudit','20','20','äººäº‹å®¡æ‰¹',NULL,NULL,NULL,NULL,'2013-06-26 17:21:04',NULL,NULL,NULL,NULL,50,NULL,NULL);

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('21','20','20',NULL,'applyUserId','string',0,NULL,NULL,NULL,'2',NULL),('28','20','20',NULL,'deptLeaderPass','boolean',0,NULL,NULL,1,NULL,NULL);

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('c',1,'æœ¬å…¬å¸ç®¡ç†å‘˜','assignment'),('d',1,'éƒ¨é—¨ç®¡ç†å‘˜','assignment'),('departAdmin',1,'éƒ¨é—¨ç®¡ç†å‘˜','assignment'),('deptLeader',1,'ç³»ç»Ÿç®¡ç†å‘˜','assignment'),('e',1,'æœ¬éƒ¨é—¨ç®¡ç†å‘˜','assignment'),('f',1,'æ™®é€šç”¨æˆ·','assignment'),('g',1,'å±±ä¸œçœç®¡ç†å‘˜','assignment'),('hr',1,'å…¬å¸ç®¡ç†å‘˜','assignment');

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('1','deptLeader'),('10','hr'),('11','c'),('12','d'),('13','e'),('14','f'),('2','deptLeader'),('3','hr'),('4','c'),('5','d'),('6','e'),('7','g'),('7','hr'),('8','hr'),('9','deptLeader');

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('1',1,'Thinkgem','','thinkgem@163.com','',NULL),('10',1,'å±±ä¸œçœåˆ†å…¬å¸æŠ€æœ¯éƒ¨','','thinkgem@163.com','',NULL),('11',1,'æµåˆ†å…¬å¸é¢†å¯¼','','thinkgem@163.com','',NULL),('12',1,'æµåˆ†å†åŸé¢†å¯¼','','thinkgem@163.com','',NULL),('13',1,'æµåˆ†å†ä¸‹é¢†å¯¼','','thinkgem@163.com','',NULL),('14',1,'æµåˆ†å†ä¸‹ç»¼åˆéƒ¨','','thinkgem@163.com','',NULL),('2',1,'ç®¡ç†å‘˜','','thinkgem@163.com','',NULL),('3',1,'ç»¼åˆéƒ¨','','thinkgem@163.com','',NULL),('4',1,'å¸‚åœºéƒ¨','','thinkgem@163.com','',NULL),('5',1,'æŠ€æœ¯éƒ¨','','thinkgem@163.com','',NULL),('6',1,'ç ”å‘éƒ¨','','thinkgem@163.com','',NULL),('7',1,'å±±åˆ†é¢†å¯¼','','thinkgem@163.com','',NULL),('8',1,'å±±åˆ†ç»¼åˆéƒ¨','','thinkgem@163.com','',NULL),('9',1,'å±±åˆ†å¸‚åœºéƒ¨','','thinkgem@163.com','',NULL);

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('1','SpringAutoDeployment',NULL,'2013-06-26 17:17:02');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`) values ('leave:1:4',1,'http://www.kafeitu.me/demo/activiti/leave','è¯·å‡æµç¨‹','leave',1,'1','leave.bpmn20.xml','leave.png','è¯·å‡æµç¨‹æ¼”ç¤º',0,1);

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_RU_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`) values ('20',2,'20','1',NULL,'leave:1:4',NULL,'hrAudit',1,0,1,0,1,2);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('23',1,NULL,'starter','2',NULL,'20',NULL),('33',1,'hr','candidate',NULL,'32',NULL,NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`SUSPENSION_STATE_`) values ('32',1,'20','20','leave:1:4','äººäº‹å®¡æ‰¹',NULL,NULL,'hrAudit',NULL,NULL,NULL,50,'2013-06-26 17:21:04',NULL,1);

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('21',1,'string','applyUserId','20','20',NULL,NULL,NULL,NULL,'2',NULL),('28',1,'boolean','deptLeaderPass','20','20',NULL,NULL,NULL,1,NULL,NULL);

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `category_id` bigint(20) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'æ ‡é¢˜',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²ï¼ˆredï¼šçº¢è‰²ï¼›greenï¼šç»¿è‰²ï¼›blueï¼šè“è‰²ï¼›yellowï¼šé»„è‰²ï¼›orangeï¼šæ©™è‰²ï¼‰',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« å›¾ç‰‡',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°ã€æ‘˜è¦',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™ï¼Œè¿‡æœŸåå°†æƒé‡è®¾ç½®ä¸ºï¼š0',
  `hits` int(11) DEFAULT '0' COMMENT 'ç‚¹å‡»æ•°',
  `posid` varchar(10) DEFAULT NULL COMMENT 'æ¨èä½ï¼Œå¤šé€‰ï¼ˆ1ï¼šé¦–é¡µç„¦ç‚¹å›¾ï¼›2ï¼šæ ç›®é¡µæ–‡ç« æ¨èï¼›ï¼‰',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¡¨';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,3,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜','green',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,3,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜','red',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,1,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,3,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,3,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜','green',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,3,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,3,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,4,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,1,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,4,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜','blue',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,4,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,4,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,5,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,5,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,5,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,1,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,7,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,7,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,7,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,7,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,8,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,8,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,8,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,8,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,9,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,9,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,9,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,9,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,9,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,11,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(28,11,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(29,11,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(30,11,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(31,11,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(32,12,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(33,12,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(34,12,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(35,12,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(36,12,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(37,13,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(38,13,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(39,13,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(40,13,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(41,14,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(42,14,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(43,14,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(44,14,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(45,14,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(46,15,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(47,15,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(48,15,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(49,16,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(50,17,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(51,17,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(52,26,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(53,26,'æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `content` text COMMENT 'æ–‡ç« å†…å®¹',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« æ¥æº',
  `relation` varchar(255) DEFAULT NULL COMMENT 'ç›¸å…³æ–‡ç« ',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¯¦è¡¨';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values (1,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(2,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(3,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(4,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(5,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(6,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(7,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(8,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(9,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(10,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(11,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(12,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(13,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(14,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(15,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(16,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(17,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(18,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(19,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(20,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(21,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(22,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(23,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(24,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(25,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(26,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(27,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(28,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(29,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(30,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(31,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(32,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(33,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(34,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(35,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(36,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(37,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(38,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(39,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(40,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(41,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(42,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(43,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(44,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(45,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(46,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(47,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(48,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(49,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(50,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(51,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(52,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),(53,'æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1');

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `site_id` bigint(20) DEFAULT '1' COMMENT 'ç«™ç‚¹ç¼–å·',
  `office_id` bigint(20) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `parent_id` bigint(20) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(255) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `module` varchar(20) DEFAULT NULL COMMENT 'æ ç›®æ¨¡å—ï¼ˆarticleï¼šæ–‡ç« ï¼›pictureï¼šå›¾ç‰‡ï¼›downloadï¼šä¸‹è½½ï¼›linkï¼šé“¾æ¥ï¼›specialï¼šä¸“é¢˜ï¼‰',
  `name` varchar(100) NOT NULL COMMENT 'æ ç›®åç§°',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡ï¼ˆ _blankã€_selfã€_parentã€_topï¼‰',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°ï¼Œå¡«å†™æœ‰åŠ©äºæœç´¢å¼•æ“ä¼˜åŒ–',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—ï¼Œå¡«å†™æœ‰åŠ©äºæœç´¢å¼•æ“ä¼˜åŒ–',
  `sort` int(11) DEFAULT '30' COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `in_menu` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨å¯¼èˆªä¸­æ˜¾ç¤ºï¼ˆ1ï¼šæ˜¾ç¤ºï¼›0ï¼šä¸æ˜¾ç¤ºï¼‰',
  `in_list` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨åˆ†ç±»é¡µä¸­æ˜¾ç¤ºåˆ—è¡¨ï¼ˆ1ï¼šæ˜¾ç¤ºï¼›0ï¼šä¸æ˜¾ç¤ºï¼‰',
  `show_modes` char(1) DEFAULT '0' COMMENT 'å±•ç°æ–¹å¼ï¼ˆ0:æœ‰å­æ ç›®æ˜¾ç¤ºæ ç›®åˆ—è¡¨ï¼Œæ— å­æ ç›®æ˜¾ç¤ºå†…å®¹åˆ—è¡¨;1ï¼šé¦–æ ç›®å†…å®¹åˆ—è¡¨ï¼›2ï¼šæ ç›®ç¬¬ä¸€æ¡å†…å®¹ï¼‰',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  `is_audit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦éœ€è¦å®¡æ ¸',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_parent_ids` (`parent_ids`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='æ ç›®è¡¨';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`site_id`,`office_id`,`parent_id`,`parent_ids`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,1,0,'0,',NULL,'é¡¶çº§æ ç›®',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,3,1,'0,1,','article','ç»„ç»‡æœºæ„',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,1,3,2,'0,1,2,','article','ç½‘ç«™ç®€ä»‹',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,1,3,2,'0,1,2,','article','å†…éƒ¨æœºæ„',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,1,3,2,'0,1,2,','article','åœ°æ–¹æœºæ„',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,1,3,1,'0,1,','article','è´¨é‡æ£€éªŒ',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,1,3,6,'0,1,6,','article','äº§å“è´¨é‡',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,1,3,6,'0,1,6,','article','æŠ€æœ¯è´¨é‡',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,1,3,6,'0,1,6,','article','å·¥ç¨‹è´¨é‡',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,1,4,1,'0,1,','article','è½¯ä»¶ä»‹ç»',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,1,4,10,'0,1,10,','article','ç½‘ç»œå·¥å…·',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,1,4,10,'0,1,10,','article','æµè§ˆå·¥å…·',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,1,4,10,'0,1,10,','article','æµè§ˆè¾…åŠ©',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,1,4,10,'0,1,10,','article','ç½‘ç»œä¼˜åŒ–',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,1,4,10,'0,1,10,','article','é‚®ä»¶å¤„ç†',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,1,4,10,'0,1,10,','article','ä¸‹è½½å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,1,4,10,'0,1,10,','article','æœç´¢å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,1,5,1,'0,1,','link','å‹æƒ…é“¾æ¥',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,1,5,18,'0,1,18,','link','å¸¸ç”¨ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,1,5,18,'0,1,18,','link','é—¨æˆ·ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,1,5,18,'0,1,18,','link','è´­ç‰©ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,1,5,18,'0,1,18,','link','äº¤å‹ç¤¾åŒº',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,1,5,18,'0,1,18,','link','éŸ³ä¹è§†é¢‘',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,1,6,1,'0,1,',NULL,'ç™¾åº¦ä¸€ä¸‹',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,1,6,1,'0,1,',NULL,'å…¨æ–‡æ£€ç´¢',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,2,6,1,'0,1,','article','æµ‹è¯•æ ç›®',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,1,6,1,'0,1,',NULL,'å…¬å…±ç•™è¨€',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `category_id` bigint(20) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `content_id` bigint(20) NOT NULL COMMENT 'æ ç›®å†…å®¹çš„ç¼–å·ï¼ˆArticle.idã€Photo.idã€Download.idï¼‰',
  `title` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å†…å®¹çš„æ ‡é¢˜ï¼ˆArticle.titleã€Photo.titleã€Download.titleï¼‰',
  `content` varchar(255) DEFAULT NULL COMMENT 'è¯„è®ºå†…å®¹',
  `name` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºå§“å',
  `ip` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºIP',
  `create_date` datetime NOT NULL COMMENT 'è¯„è®ºæ—¶é—´',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `audit_date` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¶é—´',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯„è®ºè¡¨';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `type` char(1) NOT NULL COMMENT 'ç•™è¨€åˆ†ç±»ï¼ˆ1å’¨è¯¢ã€2å»ºè®®ã€3æŠ•è¯‰ã€4å…¶å®ƒï¼‰',
  `content` varchar(255) NOT NULL COMMENT 'ç•™è¨€å†…å®¹',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(100) NOT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(100) NOT NULL COMMENT 'ç”µè¯',
  `workunit` varchar(100) NOT NULL COMMENT 'å•ä½',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT 'ç•™è¨€æ—¶é—´',
  `re_user_id` bigint(20) DEFAULT NULL COMMENT 'å›å¤äºº',
  `re_date` datetime DEFAULT NULL COMMENT 'å›å¤æ—¶é—´',
  `re_content` varchar(100) DEFAULT NULL COMMENT 'å›å¤å†…å®¹',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç•™è¨€æ¿';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `category_id` bigint(20) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'é“¾æ¥åç§°',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²ï¼ˆredï¼šçº¢è‰²ï¼›greenï¼šç»¿è‰²ï¼›blueï¼šè“è‰²ï¼›yellowï¼šé»„è‰²ï¼›orangeï¼šæ©™è‰²ï¼‰',
  `image` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥å›¾ç‰‡ï¼Œå¦‚æœä¸Šä¼ äº†å›¾ç‰‡ï¼Œåˆ™æ˜¾ç¤ºä¸ºå›¾ç‰‡é“¾æ¥',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥åœ°å€',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™ï¼Œè¿‡æœŸåå°†æƒé‡è®¾ç½®ä¸ºï¼š0',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='å‹æƒ…é“¾æ¥';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,19,'JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,19,'ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,19,'ç™¾åº¦ä¸€ä¸‹',NULL,NULL,'http://www.baidu.com',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,19,'è°·æ­Œæœç´¢',NULL,NULL,'http://www.google.com',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,20,'æ–°æµªç½‘',NULL,NULL,'http://www.sina.com.cn',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,20,'è…¾è®¯ç½‘',NULL,NULL,'http://www.qq.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,21,'æ·˜å®ç½‘',NULL,NULL,'http://www.taobao.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,21,'æ–°åç½‘',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,22,'èµ¶é›†ç½‘',NULL,NULL,'http://www.ganji.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,22,'58åŒåŸ',NULL,NULL,'http://www.58.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,23,'è§†é¢‘å¤§å…¨',NULL,NULL,'http://v.360.cn/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,23,'å‡¤å‡°ç½‘',NULL,NULL,'http://www.ifeng.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹åç§°',
  `title` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹æ ‡é¢˜',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°ï¼Œå¡«å†™æœ‰åŠ©äºæœç´¢å¼•æ“ä¼˜åŒ–',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—ï¼Œå¡«å†™æœ‰åŠ©äºæœç´¢å¼•æ“ä¼˜åŒ–',
  `theme` varchar(255) DEFAULT 'default' COMMENT 'ä¸»é¢˜',
  `copyright` text COMMENT 'ç‰ˆæƒä¿¡æ¯',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ç«™ç‚¹è¡¨';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`description`,`keywords`,`theme`,`copyright`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'é»˜è®¤ç«™ç‚¹','JeeSite Web','JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,'å­ç«™ç‚¹æµ‹è¯•','JeeSite Subsite','JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ç¼–å·',
  `start_time` datetime DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `end_time` datetime DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `leave_type` varchar(20) DEFAULT NULL COMMENT 'è¯·å‡ç±»å‹',
  `reason` varchar(255) DEFAULT NULL COMMENT 'è¯·å‡ç†ç”±',
  `apply_time` datetime DEFAULT NULL COMMENT 'ç”³è¯·æ—¶é—´',
  `reality_start_time` datetime DEFAULT NULL COMMENT 'å®é™…å¼€å§‹æ—¶é—´',
  `reality_end_time` datetime DEFAULT NULL COMMENT 'å®é™…ç»“æŸæ—¶é—´',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `oa_leave` */

insert  into `oa_leave`(`id`,`process_instance_id`,`start_time`,`end_time`,`leave_type`,`reason`,`apply_time`,`reality_start_time`,`reality_end_time`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'20','2013-06-26 17:20:25','2013-06-30 17:20:29','1','å®¶é‡Œæœ‰äº‹,éœ€è¦è¯·å‡',NULL,NULL,NULL,2,'2013-06-26 17:20:49',2,'2013-06-26 17:20:50',NULL,'0');

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `parent_id` bigint(20) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(255) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `name` varchar(100) NOT NULL COMMENT 'åŒºåŸŸåç§°',
  `type` char(1) DEFAULT NULL COMMENT 'åŒºåŸŸç±»å‹ï¼ˆ1ï¼šå›½å®¶ï¼›2ï¼šçœä»½ã€ç›´è¾–å¸‚ï¼›3ï¼šåœ°å¸‚ï¼›4ï¼šåŒºå¿ï¼‰',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_parent_ids` (`parent_ids`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸè¡¨';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`code`,`name`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,'0,','100000','ä¸­å›½','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'0,1,','110000','åŒ—äº¬å¸‚','2',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,2,'0,1,2,','110101','ä¸œåŸåŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,2,'0,1,2,','110102','è¥¿åŸåŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,2,'0,1,2,','110103','æœé˜³åŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,2,'0,1,2,','110104','ä¸°å°åŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,2,'0,1,2,','110105','æµ·æ·€åŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,1,'0,1,','370000','å±±ä¸œçœ','2',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,8,'0,1,2,','370531','æµå—å¸‚','3',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,8,'0,1,2,','370532','å†åŸåŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,8,'0,1,2,','370533','å†åŸåŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,8,'0,1,2,','370534','å†ä¸‹åŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,8,'0,1,2,','370535','å¤©æ¡¥åŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,8,'0,1,2,','370536','æ§è«åŒº','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `label` varchar(100) NOT NULL COMMENT 'æ ‡ç­¾å',
  `value` varchar(100) NOT NULL COMMENT 'æ•°æ®å€¼',
  `type` varchar(100) NOT NULL COMMENT 'ç±»å‹',
  `description` varchar(100) NOT NULL COMMENT 'æè¿°',
  `sort` int(11) NOT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='å­—å…¸è¡¨';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`label`,`value`,`type`,`description`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'æ­£å¸¸','0','del_flag','åˆ é™¤æ ‡è®°',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,'åˆ é™¤','1','del_flag','åˆ é™¤æ ‡è®°',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,'æ˜¾ç¤º','1','show_hide','æ˜¾ç¤º/éšè—',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,'éšè—','0','show_hide','æ˜¾ç¤º/éšè—',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,'æ˜¯','1','yes_no','æ˜¯/å¦',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,'å¦','0','yes_no','æ˜¯/å¦',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,'çº¢è‰²','red','color','é¢œè‰²å€¼',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,'ç»¿è‰²','green','color','é¢œè‰²å€¼',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,'è“è‰²','blue','color','é¢œè‰²å€¼',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,'é»„è‰²','yellow','color','é¢œè‰²å€¼',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,'æ©™è‰²','orange','color','é¢œè‰²å€¼',50,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,'é»˜è®¤ä¸»é¢˜','default','theme','ä¸»é¢˜æ–¹æ¡ˆ',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,'å¤©è“ä¸»é¢˜','cerulean','theme','ä¸»é¢˜æ–¹æ¡ˆ',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,'æ©™è‰²ä¸»é¢˜','readable','theme','ä¸»é¢˜æ–¹æ¡ˆ',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,'çº¢è‰²ä¸»é¢˜','united','theme','ä¸»é¢˜æ–¹æ¡ˆ',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,'Flatä¸»é¢˜','flat','theme','ä¸»é¢˜æ–¹æ¡ˆ',60,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,'å›½å®¶','1','sys_area_type','åŒºåŸŸç±»å‹',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,'çœä»½ã€ç›´è¾–å¸‚','2','sys_area_type','åŒºåŸŸç±»å‹',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,'åœ°å¸‚','3','sys_area_type','åŒºåŸŸç±»å‹',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,'åŒºå¿','4','sys_area_type','åŒºåŸŸç±»å‹',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,'å…¬å¸','1','sys_office_type','æœºæ„ç±»å‹',60,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,'éƒ¨é—¨','2','sys_office_type','æœºæ„ç±»å‹',70,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,'ä¸€çº§','1','sys_office_grade','æœºæ„ç­‰çº§',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,'äºŒçº§','2','sys_office_grade','æœºæ„ç­‰çº§',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,'ä¸‰çº§','3','sys_office_grade','æœºæ„ç­‰çº§',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,'å››çº§','4','sys_office_grade','æœºæ„ç­‰çº§',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,'æ‰€æœ‰æ•°æ®','1','sys_data_scope','æ•°æ®èŒƒå›´',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(28,'æ‰€åœ¨å…¬å¸åŠä»¥ä¸‹æ•°æ®','2','sys_data_scope','æ•°æ®èŒƒå›´',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(29,'æ‰€åœ¨å…¬å¸æ•°æ®','3','sys_data_scope','æ•°æ®èŒƒå›´',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(30,'æ‰€åœ¨éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®','4','sys_data_scope','æ•°æ®èŒƒå›´',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(31,'æ‰€åœ¨éƒ¨é—¨æ•°æ®','5','sys_data_scope','æ•°æ®èŒƒå›´',50,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(32,'ä»…æœ¬äººæ•°æ®','8','sys_data_scope','æ•°æ®èŒƒå›´',90,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(33,'æŒ‰æ˜ç»†è®¾ç½®','9','sys_data_scope','æ•°æ®èŒƒå›´',100,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(34,'ç³»ç»Ÿç®¡ç†','1','sys_user_type','ç”¨æˆ·ç±»å‹',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(35,'éƒ¨é—¨ç»ç†','2','sys_user_type','ç”¨æˆ·ç±»å‹',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(36,'æ™®é€šç”¨æˆ·','3','sys_user_type','ç”¨æˆ·ç±»å‹',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(37,'åŸºç¡€ä¸»é¢˜','basic','cms_theme','ç«™ç‚¹ä¸»é¢˜',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(38,'è“è‰²ä¸»é¢˜','blue','cms_theme','ç«™ç‚¹ä¸»é¢˜',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(39,'çº¢è‰²ä¸»é¢˜','red','cms_theme','ç«™ç‚¹ä¸»é¢˜',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(40,'æ–‡ç« æ¨¡å‹','article','cms_module','æ ç›®æ¨¡å‹',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(41,'å›¾ç‰‡æ¨¡å‹','picture','cms_module','æ ç›®æ¨¡å‹',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(42,'ä¸‹è½½æ¨¡å‹','download','cms_module','æ ç›®æ¨¡å‹',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(43,'é“¾æ¥æ¨¡å‹','link','cms_module','æ ç›®æ¨¡å‹',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(44,'ä¸“é¢˜æ¨¡å‹','special','cms_module','æ ç›®æ¨¡å‹',50,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(45,'é»˜è®¤å±•ç°æ–¹å¼','0','cms_show_modes','å±•ç°æ–¹å¼',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(46,'é¦–æ ç›®å†…å®¹åˆ—è¡¨','1','cms_show_modes','å±•ç°æ–¹å¼',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(47,'æ ç›®ç¬¬ä¸€æ¡å†…å®¹','2','cms_show_modes','å±•ç°æ–¹å¼',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(48,'å‘å¸ƒ','0','cms_del_flag','å†…å®¹çŠ¶æ€',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(49,'åˆ é™¤','1','cms_del_flag','å†…å®¹çŠ¶æ€',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(50,'å®¡æ ¸','2','cms_del_flag','å†…å®¹çŠ¶æ€',15,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(51,'é¦–é¡µç„¦ç‚¹å›¾','1','cms_posid','æ¨èä½',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(52,'æ ç›®é¡µæ–‡ç« æ¨è','2','cms_posid','æ¨èä½',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(53,'å’¨è¯¢','1','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(54,'å»ºè®®','2','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(55,'æŠ•è¯‰','3','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(56,'å…¶å®ƒ','4','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(57,'å…¬ä¼‘','1','oa_leave_type','è¯·å‡ç±»å‹',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(58,'ç—…å‡','2','oa_leave_type','è¯·å‡ç±»å‹',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(59,'äº‹å‡','3','oa_leave_type','è¯·å‡ç±»å‹',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(60,'è°ƒä¼‘','4','oa_leave_type','è¯·å‡ç±»å‹',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(61,'å©šå‡','5','oa_leave_type','è¯·å‡ç±»å‹',60,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(62,'æ¥å…¥æ—¥å¿—','1','sys_log_type','æ—¥å¿—ç±»å‹',30,1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(63,'å¼‚å¸¸æ—¥å¿—','2','sys_log_type','æ—¥å¿—ç±»å‹',40,1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(64,'é‡‡è´­åˆåŒ','1','contract_type','é‡‡è´­åˆåŒ',1,2,'2013-07-11 15:29:27',2,'2013-07-11 15:29:27',NULL,'0'),(65,'é”€å”®åˆåŒ','2','contract_type','é”€å”®åˆåŒ',2,2,'2013-07-11 15:29:55',2,'2013-07-11 15:29:55',NULL,'0'),(66,'æ±½è¿','1','trans_type','è¿è¾“ç±»å‹',1,2,'2013-07-16 16:07:23',2,'2013-07-16 16:07:23',NULL,'0'),(67,'é“è¿','2','trans_type','è¿è¾“ç±»å‹',2,2,'2013-07-16 16:08:04',2,'2013-07-16 16:08:04',NULL,'0'),(68,'æ— ç¥¨','1','pay_mode','ç»“ç®—æ–¹å¼',1,2,'2013-07-16 16:09:08',2,'2013-07-16 16:09:08',NULL,'0'),(69,'ä¸€ç¥¨','2','pay_mode','ç»“ç®—æ–¹å¼',2,2,'2013-07-16 16:09:21',2,'2013-07-16 16:09:21',NULL,'0'),(70,'ä¸¤ç¥¨ç…¤çš„å¢å€¼ç¨','3','pay_mode','ç»“ç®—æ–¹å¼',3,2,'2013-07-16 16:09:59',2,'2013-07-16 16:09:59',NULL,'0'),(71,'åŸç…¤','1','coal_type','ç…¤ç‚­ç§ç±»',1,2,'2013-07-16 16:15:11',2,'2013-07-16 16:15:11',NULL,'0'),(72,'é€šè¿‡åœ°ç£…å¨ä½','1','pay_type','ç»“ç®—ç±»å‹',1,2,'2013-07-16 16:16:04',2,'2013-07-16 16:16:04',NULL,'0'),(73,'é€šè¿‡è½¨é“è¡¡','2','pay_type','ç»“ç®—ç±»å‹',2,2,'2013-07-16 16:16:23',2,'2013-07-16 16:16:23',NULL,'0'),(74,'æ˜¯','1','tax_flag','æ˜¯å¦å«ç¨',1,2,'2013-07-16 16:18:58',2,'2013-07-16 16:18:58',NULL,'0'),(75,'å¦','0','tax_flag','æ˜¯å¦å«ç¨',0,2,'2013-07-16 16:19:07',2,'2013-07-16 16:19:07',NULL,'0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT '1' COMMENT 'æ—¥å¿—ç±»å‹ï¼ˆ1ï¼šæ¥å…¥æ—¥å¿—ï¼›2ï¼šå¼‚å¸¸æ—¥å¿—ï¼‰',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT 'æ“ä½œIPåœ°å€',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ç”¨æˆ·ä»£ç†',
  `request_uri` varchar(255) DEFAULT NULL COMMENT 'è¯·æ±‚URI',
  `method` varchar(5) DEFAULT NULL COMMENT 'æ“ä½œæ–¹å¼',
  `params` text COMMENT 'æ“ä½œæäº¤çš„æ•°æ®',
  `exception` text COMMENT 'å¼‚å¸¸ä¿¡æ¯',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) values (1,'1',2,'2013-06-26 17:20:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/oa/leave/save','POST','id=&startTime=2013-06-26 17:20:25&endTime=2013-06-30 17:20:29&reason=å®¶é‡Œæœ‰äº‹,éœ€è¦è¯·å‡&leaveType=1',''),(2,'1',2,'2013-06-26 17:29:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/sys/role/save','POST','id=4&menuIds=1,27,28,29,30,62,63,64,65,66,31,40,41,42,43,44,45,46,48,49,47,50,51,52,53,54,55,56,58,59,57,60,61...&dataScope=4&office.name=åŒ—äº¬å¸‚æ€»å…¬å¸&name=éƒ¨é—¨ç®¡ç†å‘˜&officeIds=&roleType=assignment&office.id=1&oldName=éƒ¨é—¨ç®¡ç†å‘˜&enname=departAdmin',''),(3,'2',2,'2013-06-26 17:42:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/sys/user/modifyPwd','GET','','org.springframework.web.util.NestedServletException: Handler processing failed; nested exception is java.lang.OutOfMemoryError: PermGen space'),(4,'2',2,'2013-06-26 17:42:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/oa/leave','GET','','org.springframework.web.util.NestedServletException: Handler processing failed; nested exception is java.lang.OutOfMemoryError: PermGen space'),(5,'1',2,'2013-07-11 11:22:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=file&sort=30&parent.id=1&name=åˆåŒç®¡ç†&target=&permission=&href=&parent.name=é¡¶çº§èœå•&isShow=1',''),(6,'1',2,'2013-07-11 11:27:56','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=69&icon=file&sort=300&parent.id=1&name=åˆåŒç®¡ç†&target=&permission=&href=&parent.name=é¡¶çº§èœå•&isShow=1',''),(7,'1',2,'2013-07-11 11:30:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=69&name=åŸºç¡€æ•°æ®ç®¡ç†&target=&permission=&href=&parent.name=åˆåŒç®¡ç†&isShow=1',''),(8,'1',2,'2013-07-11 11:30:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=69&icon=&sort=300&parent.id=1&name=åˆåŒç®¡ç†&target=&permission=&href=&parent.name=é¡¶çº§èœå•&isShow=1',''),(9,'1',2,'2013-07-11 11:30:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=user&sort=30&parent.id=70&name=ä¾›æ–¹ç®¡ç†&target=&permission=&href=&parent.name=åŸºç¡€æ•°æ®ç®¡ç†&isShow=1',''),(10,'1',2,'2013-07-11 11:31:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=user&sort=40&parent.id=70&name=éœ€æ–¹ç®¡ç†&target=&permission=&href=&parent.name=åŸºç¡€æ•°æ®ç®¡ç†&isShow=1',''),(11,'1',2,'2013-07-11 11:32:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=71&icon=user&sort=30&parent.id=70&name=ä¾›æ–¹ç®¡ç†&target=&permission=&href=/coal/supply&parent.name=åŸºç¡€æ•°æ®ç®¡ç†&isShow=1',''),(12,'1',2,'2013-07-11 11:32:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=72&icon=user&sort=40&parent.id=70&name=éœ€æ–¹ç®¡ç†&target=&permission=&href=/coal/demand&parent.name=åŸºç¡€æ•°æ®ç®¡ç†&isShow=1',''),(13,'1',2,'2013-07-11 11:35:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=71&name=æŸ¥çœ‹&target=&permission=coal:supply:view&href=&parent.name=ä¾›æ–¹ç®¡ç†&isShow=0',''),(14,'1',2,'2013-07-11 11:35:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=71&name=ä¿®æ”¹&target=&permission=coal:supply:edit&href=&parent.name=ä¾›æ–¹ç®¡ç†&isShow=0',''),(15,'1',2,'2013-07-11 11:35:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=72&name=æŸ¥çœ‹&target=&permission=coal:demand:view&href=&parent.name=éœ€æ–¹ç®¡ç†&isShow=0',''),(16,'1',2,'2013-07-11 11:35:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=72&name=ä¿®æ”¹&target=&permission=coal:demand:edit&href=&parent.name=éœ€æ–¹ç®¡ç†&isShow=0',''),(17,'2',2,'2013-07-11 11:38:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=å‘¼ä¼¦è´å°”ç…¤çŸ¿','org.springframework.dao.InvalidDataAccessResourceUsageException: Unknown column \'supply_name\' in \'field list\'; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Unknown column \'supply_name\' in \'field list\''),(18,'2',2,'2013-07-11 11:39:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=å‘¼ä¼¦è´å°”ç…¤çŸ¿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'SUPPLY_ID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'SUPPLY_ID\' doesn\'t have a default value'),(19,'2',2,'2013-07-11 11:40:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=å‘¼ä¼¦è´å°”ç…¤çŸ¿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'SUPPLY_ID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'SUPPLY_ID\' doesn\'t have a default value'),(20,'2',2,'2013-07-11 11:41:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=å†…è’™å¤ç…¤çŸ¿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'SUPPLY_ID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'SUPPLY_ID\' doesn\'t have a default value'),(21,'1',2,'2013-07-11 11:42:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(22,'1',2,'2013-07-11 11:43:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/demand/save','POST','demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&demandId=',''),(23,'1',2,'2013-07-11 11:43:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/demand/delete','GET','id=1',''),(24,'1',2,'2013-07-11 11:57:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=40&parent.id=69&name=åˆåŒç®¡ç†&target=&permission=&href=&parent.name=åˆåŒç®¡ç†&isShow=1',''),(25,'1',2,'2013-07-11 11:58:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=77&name=åˆåŒå½•å…¥&target=&permission=&href=/coal/contract&parent.name=åˆåŒç®¡ç†&isShow=1',''),(26,'1',2,'2013-07-11 11:59:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=78&icon=file&sort=30&parent.id=77&name=åˆåŒå½•å…¥&target=&permission=&href=/coal/contract&parent.name=åˆåŒç®¡ç†&isShow=1',''),(27,'1',2,'2013-07-11 11:59:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=78&name=æŸ¥çœ‹&target=&permission=coal:contract:view&href=&parent.name=åˆåŒå½•å…¥&isShow=0',''),(28,'1',2,'2013-07-11 12:00:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=78&name=ä¿®æ”¹&target=&permission=coal:contract:edit&href=&parent.name=åˆåŒå½•å…¥&isShow=0',''),(29,'2',2,'2013-07-11 12:00:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(30,'2',2,'2013-07-11 12:00:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(31,'2',2,'2013-07-11 12:01:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(32,'2',2,'2013-07-11 12:01:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(33,'2',2,'2013-07-11 12:02:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(34,'2',2,'2013-07-11 12:03:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(35,'2',2,'2013-07-11 12:03:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(36,'2',2,'2013-07-11 12:04:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(37,'2',2,'2013-07-11 12:07:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.PropertyNotFoundException: The class \'com.zhongxin.ctsms.modules.coal.entity.Contract\' does not have the property \'id\'.'),(38,'2',2,'2013-07-11 14:21:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: /WEB-INF/views/modules/coal/contractForm.jsp(51,16) PWC6287: The attribute prefix fncoal does not correspond to any imported tag library'),(39,'2',2,'2013-07-11 14:21:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(40,'2',2,'2013-07-11 14:22:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(41,'2',2,'2013-07-11 14:22:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(42,'2',2,'2013-07-11 14:27:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(43,'2',2,'2013-07-11 14:28:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(44,'2',2,'2013-07-11 14:36:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(45,'2',2,'2013-07-11 14:36:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(46,'2',2,'2013-07-11 14:36:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(47,'2',2,'2013-07-11 15:22:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: /WEB-INF/views/modules/coal/contractForm.jsp(81,28) PWC6297: The function getDemandName cannot be located with the specified prefix'),(48,'1',2,'2013-07-11 15:29:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=é‡‡è´­åˆåŒ&value=1&label=é‡‡è´­åˆåŒ&type=contract_type',''),(49,'1',2,'2013-07-11 15:29:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=é”€å”®åˆåŒ&value=2&label=é”€å”®åˆåŒ&type=contract_type',''),(50,'1',2,'2013-07-11 15:41:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/demand/save','POST','demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&demandId=&remarks=',''),(51,'1',2,'2013-07-11 15:42:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2017-07-31&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-18&contractSid=&contractType=1&contractId=T123098423&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(52,'1',2,'2013-07-11 15:48:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2014-07-11&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-11&contractSid=&contractType=1&contractId=T123098423&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(53,'2',2,'2013-07-11 15:59:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/demand/findByName','GET','name=å‘¼å’Œæµ©ç‰¹','org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1; nested exception is java.lang.IllegalArgumentException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1'),(54,'2',2,'2013-07-11 16:07:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/demand/findByName','GET','name=å‘¼å’Œæµ©ç‰¹','org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1; nested exception is java.lang.IllegalArgumentException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1'),(55,'2',2,'2013-07-11 16:18:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-11&contractSid=&contractType=1&contractId=T123098423&supplyName=å†…è’™å¤ç…¤çŸ¿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'CONTRACT_SID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'CONTRACT_SID\' doesn\'t have a default value'),(56,'2',2,'2013-07-11 16:19:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2016-07-11&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-11&contractSid=&contractType=1&contractId=T123098423&supplyName=å†…è’™å¤ç…¤çŸ¿','org.springframework.dao.DataIntegrityViolationException: Data truncation: Out of range value for column \'AMOUNT\' at row 1; SQL [n/a]; nested exception is org.hibernate.exception.DataException: Data truncation: Out of range value for column \'AMOUNT\' at row 1'),(57,'1',2,'2013-07-11 16:21:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-11&contractSid=&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(58,'2',2,'2013-07-11 16:41:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: /WEB-INF/views/modules/coal/contractList.jsp(39,22) PWC6297: The function getSupplyName cannot be located with the specified prefix'),(59,'2',2,'2013-07-11 16:44:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/','POST','pageSize=10&contractId=33&pageNo=1&contractType=2','org.springframework.orm.hibernate3.HibernateQueryException: could not resolve property: name of: com.zhongxin.ctsms.modules.coal.entity.Contract; nested exception is org.hibernate.QueryException: could not resolve property: name of: com.zhongxin.ctsms.modules.coal.entity.Contract'),(60,'1',2,'2013-07-11 16:54:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=&contractSid=&contractType=1&contractId=12&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(61,'1',2,'2013-07-11 16:59:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=&contractSid=&contractType=1&contractId=12&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(62,'1',2,'2013-07-11 17:16:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=&contractSid=&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(63,'1',2,'2013-07-11 17:18:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&number=1000&endDate=&remarks=&supplyId=1&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&amount=5000000000&signDate=&contractSid=&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(64,'1',2,'2013-07-11 17:27:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=&contractSid=&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(65,'1',2,'2013-07-16 12:17:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&fileData[0]=220417mhwhw4ic7necmnhx.jpg&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(66,'1',2,'2013-07-16 12:24:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&fileData[0]=2012å¹´ç»ˆå·¥ä½œæ€»ç»“æ¨¡æ¿.pptx&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(67,'1',2,'2013-07-16 12:25:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&fileData[0]=2012å¹´ç»ˆå·¥ä½œæ€»ç»“æ¨¡æ¿.pptx&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(68,'1',2,'2013-07-16 12:27:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&fileData[0]=2012å¹´ç»ˆå·¥ä½œæ€»ç»“æ¨¡æ¿.pptx&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(69,'1',2,'2013-07-16 12:31:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(70,'1',2,'2013-07-16 14:36:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(71,'2',2,'2013-07-16 15:02:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','id=1','org.apache.jasper.JasperException: javax.el.PropertyNotFoundException: The class \'com.zhongxin.ctsms.modules.coal.entity.Contract\' does not have the property \'id\'.'),(72,'2',2,'2013-07-16 15:02:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','id=1','org.apache.jasper.JasperException: javax.el.PropertyNotFoundException: The class \'com.zhongxin.ctsms.modules.coal.entity.PFile\' does not have the property \'url\'.'),(73,'1',2,'2013-07-16 15:06:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(74,'2',2,'2013-07-16 15:27:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'coalType\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'coalType\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(75,'2',2,'2013-07-16 15:30:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Unknown column \'this_.calorie\' in \'field list\'; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Unknown column \'this_.calorie\' in \'field list\''),(76,'1',2,'2013-07-16 16:05:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=&demandId=2&number=1000&endDate=&remarks=&calorie=23456&supplyId=1&taxFlag=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&price=4000&signDate=2013-07-16&contractSid=&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(77,'1',2,'2013-07-16 16:05:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&price=4000.0&signDate=2013-07-16&contractSid=&contractType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(78,'1',2,'2013-07-16 16:07:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=è¿è¾“ç±»å‹&value=1&label=æ±½è¿&type=trans_type',''),(79,'1',2,'2013-07-16 16:08:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=è¿è¾“ç±»å‹&value=2&label=é“è¿&type=trans_type',''),(80,'1',2,'2013-07-16 16:09:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=ç»“ç®—æ–¹å¼&value=1&label=æ— ç¥¨&type=pay_mode',''),(81,'1',2,'2013-07-16 16:09:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=ç»“ç®—æ–¹å¼&value=2&label=ä¸€ç¥¨&type=pay_mode',''),(82,'1',2,'2013-07-16 16:09:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=3&description=ç»“ç®—æ–¹å¼&value=3&label=ä¸¤ç¥¨ç…¤çš„å¢å€¼ç¨&type=pay_mode',''),(83,'1',2,'2013-07-16 16:15:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=ç…¤ç‚­ç§ç±»&value=1&label=åŸç…¤&type=coal_type',''),(84,'1',2,'2013-07-16 16:16:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=ç»“ç®—ç±»å‹&value=1&label=é€šè¿‡åœ°ç£…å¨ä½&type=pay_type',''),(85,'1',2,'2013-07-16 16:16:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=ç»“ç®—ç±»å‹&value=2&label=é€šè¿‡è½¨é“è¡¡&type=pay_type',''),(86,'1',2,'2013-07-16 16:18:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=æ˜¯å¦å«ç¨&value=1&label=æ˜¯&type=tax_flag',''),(87,'1',2,'2013-07-16 16:19:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=0&description=æ˜¯å¦å«ç¨&value=0&label=å¦&type=tax_flag',''),(88,'2',2,'2013-07-16 16:19:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/delFile','GET','id=4&prjId=2','java.lang.NumberFormatException: null'),(89,'1',2,'2013-07-16 16:23:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=1&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&transType=1&signDate=2013-07-16&price=4000.0&contractSid=2&contractType=1&payType=1&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(90,'1',2,'2013-07-16 17:12:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=file&sort=40&parent.id=77&name=é‡‡è´­åˆåŒå½•å…¥&target=&permission=&href=/coal/contract/purchase&parent.name=åˆåŒç®¡ç†&isShow=1',''),(91,'2',2,'2013-07-16 17:13:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist'),(92,'2',2,'2013-07-16 17:17:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist'),(93,'2',2,'2013-07-16 17:19:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/form','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'transType\' of bean class [com.zhongxin.ctsms.modules.coal.entity.contract.PurchaseContract]: Bean property \'transType\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(94,'2',2,'2013-07-16 17:20:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/form','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'transType\' of bean class [com.zhongxin.ctsms.modules.coal.entity.contract.PurchaseContract]: Bean property \'transType\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(95,'1',2,'2013-07-16 17:21:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&price=4000&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(96,'1',2,'2013-07-16 17:25:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(97,'1',2,'2013-07-16 17:25:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(98,'1',2,'2013-07-16 17:28:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(99,'1',2,'2013-07-16 17:59:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2016-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(100,'1',2,'2013-07-16 18:03:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿',''),(101,'1',2,'2013-07-16 18:05:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=å†…è’™å¤æ–°æ¬¢å¹¿åœº&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=å†…è’™å¤ç…¤çŸ¿','');

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `parent_id` bigint(20) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(255) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'è§’è‰²åç§°',
  `description` varchar(100) DEFAULT NULL COMMENT 'æè¿°',
  `sort` int(11) DEFAULT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_parent_ids` (`parent_ids`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸè¡¨';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `parent_id` bigint(20) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(255) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'èœå•åç§°',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡ï¼ˆmainFrameã€ _blankã€_selfã€_parentã€_topï¼‰',
  `icon` varchar(100) DEFAULT NULL COMMENT 'å›¾æ ‡',
  `sort` int(11) NOT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `is_show` char(1) NOT NULL COMMENT 'æ˜¯å¦åœ¨èœå•ä¸­æ˜¾ç¤ºï¼ˆ1ï¼šæ˜¾ç¤ºï¼›0ï¼šä¸æ˜¾ç¤ºï¼‰',
  `permission` varchar(200) DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_parent_ids` (`parent_ids`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='èœå•è¡¨';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`href`,`target`,`icon`,`sort`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,'0,','é¡¶çº§èœå•',NULL,NULL,NULL,0,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'0,1,','ç³»ç»Ÿè®¾ç½®',NULL,NULL,NULL,900,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,2,'0,1,2,','ç³»ç»Ÿè®¾ç½®',NULL,NULL,NULL,980,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,3,'0,1,2,3,','èœå•ç®¡ç†','/sys/menu/',NULL,'list-alt',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,4,'0,1,2,3,4,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','sys:menu:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,4,'0,1,2,3,4,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','sys:menu:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,3,'0,1,2,3,','è§’è‰²ç®¡ç†','/sys/role/',NULL,'lock',50,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,7,'0,1,2,3,7,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','sys:role:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,7,'0,1,2,3,7,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','sys:role:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,3,'0,1,2,3,','å­—å…¸ç®¡ç†','/sys/dict/',NULL,'th-list',60,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,10,'0,1,2,3,10,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','sys:dict:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,10,'0,1,2,3,10,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','sys:dict:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,2,'0,1,2,','æœºæ„ç”¨æˆ·',NULL,NULL,NULL,970,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,13,'0,1,2,13,','åŒºåŸŸç®¡ç†','/sys/area/',NULL,'th',50,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,14,'0,1,2,13,14,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','sys:area:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,14,'0,1,2,13,14,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','sys:area:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,13,'0,1,2,13,','æœºæ„ç®¡ç†','/sys/office/',NULL,'th-large',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,17,'0,1,2,13,17,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','sys:office:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,17,'0,1,2,13,17,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','sys:office:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,13,'0,1,2,13,','ç”¨æˆ·ç®¡ç†','/sys/user/',NULL,'user',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,20,'0,1,2,13,20,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','sys:user:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,20,'0,1,2,13,20,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','sys:user:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,2,'0,1,2,','å…³äºå¸®åŠ©',NULL,NULL,NULL,990,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,23,'0,1,2,23','é¡¹ç›®é¦–é¡µ','http://jeesite.com','_blank',NULL,30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,23,'0,1,2,23','é¡¹ç›®ç»´åŸº','https://github.com/thinkgem/jeesite/wiki','_blank',NULL,50,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,23,'0,1,2,23','é—®é¢˜åé¦ˆ','https://github.com/thinkgem/jeesite/issues/new','_blank',NULL,80,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,1,'0,1,','æˆ‘çš„é¢æ¿',NULL,NULL,NULL,100,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(28,27,'0,1,27,','ä¸ªäººä¿¡æ¯',NULL,NULL,NULL,990,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(29,28,'0,1,27,28,','ä¸ªäººä¿¡æ¯','/sys/user/info',NULL,'user',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(30,28,'0,1,27,28,','ä¿®æ”¹å¯†ç ','/sys/user/modifyPwd',NULL,'lock',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(31,1,'0,1,','å†…å®¹ç®¡ç†',NULL,NULL,NULL,500,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(32,31,'0,1,31,','æ ç›®è®¾ç½®',NULL,NULL,NULL,990,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(33,32,'0,1,31,32','æ ç›®ç®¡ç†','/cms/category/',NULL,'align-justify',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(34,33,'0,1,31,32,33,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','cms:category:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(35,33,'0,1,31,32,33,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','cms:category:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(36,32,'0,1,31,32','ç«™ç‚¹è®¾ç½®','/cms/site/',NULL,'certificate',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(37,36,'0,1,31,32,36,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','cms:site:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(38,36,'0,1,31,32,36,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','cms:site:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(39,32,'0,1,31,32','åˆ‡æ¢ç«™ç‚¹','/cms/site/select',NULL,'retweet',50,'1','cms:site:select',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(40,31,'0,1,31,','å†…å®¹ç®¡ç†',NULL,NULL,NULL,500,'1','cms:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(41,40,'0,1,31,40,','å†…å®¹å‘å¸ƒ','/cms/',NULL,'briefcase',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(42,41,'0,1,31,40,41,','æ–‡ç« æ¨¡å‹','/cms/article/',NULL,'file',40,'0',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(43,42,'0,1,31,40,41,42,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','cms:article:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(44,42,'0,1,31,40,41,42,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','cms:article:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(45,42,'0,1,31,40,41,42,','å®¡æ ¸',NULL,NULL,NULL,30,'0','cms:article:audit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(46,41,'0,1,31,40,41,','é“¾æ¥æ¨¡å‹','/cms/link/',NULL,'random',60,'0',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(47,46,'0,1,31,40,41,46,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','cms:link:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(48,46,'0,1,31,40,41,46,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','cms:link:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(49,46,'0,1,31,40,41,46,','å®¡æ ¸',NULL,NULL,NULL,30,'0','cms:link:audit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(50,40,'0,1,31,40,','è¯„è®ºç®¡ç†','/cms/comment/?status=2',NULL,'comment',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(51,50,'0,1,31,40,50,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','cms:comment:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(52,50,'0,1,31,40,50,','å®¡æ ¸',NULL,NULL,NULL,30,'0','cms:comment:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(53,40,'0,1,31,40,','å…¬å…±ç•™è¨€','/cms/guestbook/?status=2',NULL,'glass',80,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(54,53,'0,1,31,40,53,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','cms:guestbook:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(55,53,'0,1,31,40,53,','å®¡æ ¸',NULL,NULL,NULL,30,'0','cms:guestbook:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(56,40,'0,1,31,40,','æ–‡ä»¶ç®¡ç†','/../static/ckfinder/ckfinder.html',NULL,'folder-open',90,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(57,56,'0,1,31,40,56,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','cms:ckfinder:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(58,56,'0,1,31,40,56,','ä¸Šä¼ ',NULL,NULL,NULL,30,'0','cms:ckfinder:upload',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(59,56,'0,1,31,40,56,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','cms:ckfinder:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(60,31,'0,1,31,','ç»Ÿè®¡åˆ†æ',NULL,NULL,NULL,600,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(61,60,'0,1,31,60,','ä¿¡æ¯é‡ç»Ÿè®¡','/cms/stats/article',NULL,'tasks',30,'1','cms:stats:article',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(62,1,'0,1,','åœ¨çº¿åŠå…¬',NULL,NULL,NULL,200,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(63,62,'0,1,62,','ä¸ªäººåŠå…¬',NULL,NULL,NULL,30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(64,63,'0,1,62,63,','è¯·å‡åŠç†','/oa/leave',NULL,'leaf',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(65,64,'0,1,62,63,64,','æŸ¥çœ‹',NULL,NULL,NULL,30,'0','oa:leave:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(66,64,'0,1,62,63,64,','ä¿®æ”¹',NULL,NULL,NULL,30,'0','oa:leave:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(67,2,'0,1,2,','æ—¥å¿—æŸ¥è¯¢',NULL,NULL,NULL,985,'1',NULL,1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(68,67,'0,1,2,67,','æ—¥å¿—æŸ¥è¯¢','/sys/log',NULL,'pencil',30,'1','sys:log:view',1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(69,1,'0,1,','åˆåŒç®¡ç†','','','',300,'1','',2,'2013-07-11 11:22:05',2,'2013-07-11 11:30:17',NULL,'0'),(70,69,'0,1,69,','åŸºç¡€æ•°æ®ç®¡ç†','','','',30,'1','',2,'2013-07-11 11:30:06',2,'2013-07-11 11:30:06',NULL,'0'),(71,70,'0,1,69,70,','ä¾›æ–¹ç®¡ç†','/coal/supply','','user',30,'1','',2,'2013-07-11 11:30:57',2,'2013-07-11 11:32:34',NULL,'0'),(72,70,'0,1,69,70,','éœ€æ–¹ç®¡ç†','/coal/demand','','user',40,'1','',2,'2013-07-11 11:31:17',2,'2013-07-11 11:32:46',NULL,'0'),(73,71,'0,1,69,70,71,','æŸ¥çœ‹','','','',30,'0','coal:supply:view',2,'2013-07-11 11:35:00',2,'2013-07-11 11:35:00',NULL,'0'),(74,71,'0,1,69,70,71,','ä¿®æ”¹','','','',30,'0','coal:supply:edit',2,'2013-07-11 11:35:23',2,'2013-07-11 11:35:23',NULL,'0'),(75,72,'0,1,69,70,72,','æŸ¥çœ‹','','','',30,'0','coal:demand:view',2,'2013-07-11 11:35:41',2,'2013-07-11 11:35:41',NULL,'0'),(76,72,'0,1,69,70,72,','ä¿®æ”¹','','','',30,'0','coal:demand:edit',2,'2013-07-11 11:35:54',2,'2013-07-11 11:35:54',NULL,'0'),(77,69,'0,1,69,','åˆåŒç®¡ç†','','','',40,'1','',2,'2013-07-11 11:57:38',2,'2013-07-11 11:57:38',NULL,'0'),(78,77,'0,1,69,77,','åˆåŒå½•å…¥','/coal/contract','','file',30,'1','',2,'2013-07-11 11:58:01',2,'2013-07-11 11:59:11',NULL,'0'),(79,78,'0,1,69,77,78,','æŸ¥çœ‹','','','',30,'0','coal:contract:view',2,'2013-07-11 11:59:42',2,'2013-07-11 11:59:42',NULL,'0'),(80,78,'0,1,69,77,78,','ä¿®æ”¹','','','',30,'0','coal:contract:edit',2,'2013-07-11 12:00:00',2,'2013-07-11 12:00:00',NULL,'0'),(81,77,'0,1,69,77,','é‡‡è´­åˆåŒå½•å…¥','/coal/contract/purchase','','file',40,'1','',2,'2013-07-16 17:12:01',2,'2013-07-16 17:12:01',NULL,'0');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `parent_id` bigint(20) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(255) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `area_id` bigint(20) NOT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `name` varchar(100) NOT NULL COMMENT 'æœºæ„åç§°',
  `type` char(1) NOT NULL COMMENT 'æœºæ„ç±»å‹ï¼ˆ1ï¼šå…¬å¸ï¼›2ï¼šéƒ¨é—¨ï¼›3ï¼šå°ç»„ï¼‰',
  `grade` char(1) NOT NULL COMMENT 'æœºæ„ç­‰çº§ï¼ˆ1ï¼šä¸€çº§ï¼›2ï¼šäºŒçº§ï¼›3ï¼šä¸‰çº§ï¼›4ï¼šå››çº§ï¼‰',
  `address` varchar(255) DEFAULT NULL COMMENT 'è”ç³»åœ°å€',
  `zip_code` varchar(100) DEFAULT NULL COMMENT 'é‚®æ”¿ç¼–ç ',
  `master` varchar(100) DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `fax` varchar(200) DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_parent_ids` (`parent_ids`),
  KEY `sys_office_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='éƒ¨é—¨è¡¨';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`area_id`,`code`,`name`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,'0,',2,'100000','åŒ—äº¬å¸‚æ€»å…¬å¸','1','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'0,1,',2,'100001','å…¬å¸é¢†å¯¼','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,1,'0,1,',2,'100002','äººåŠ›éƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,1,'0,1,',2,'100003','å¸‚åœºéƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,1,'0,1,',2,'100004','æŠ€æœ¯éƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,1,'0,1,',2,'100005','ç ”å‘éƒ¨','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,1,'0,1,',8,'200000','å±±ä¸œçœåˆ†å…¬å¸','1','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,7,'0,1,7,',8,'200001','å…¬å¸é¢†å¯¼','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,7,'0,1,7,',8,'200002','ç»¼åˆéƒ¨','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,7,'0,1,7,',8,'200003','å¸‚åœºéƒ¨','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,7,'0,1,7,',8,'200004','æŠ€æœ¯éƒ¨','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,7,'0,1,7,',9,'201000','æµå—å¸‚åˆ†å…¬å¸','1','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,12,'0,1,7,12,',9,'201001','å…¬å¸é¢†å¯¼','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,12,'0,1,7,12,',9,'201002','ç»¼åˆéƒ¨','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,12,'0,1,7,12,',9,'201003','å¸‚åœºéƒ¨','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,12,'0,1,7,12,',9,'201004','æŠ€æœ¯éƒ¨','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,12,'0,1,7,12,',11,'201010','æµå—å¸‚å†åŸåŒºåˆ†å…¬å¸','1','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,17,'0,1,7,12,17,',11,'201011','å…¬å¸é¢†å¯¼','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,17,'0,1,7,12,17,',11,'201012','ç»¼åˆéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,17,'0,1,7,12,17,',11,'201013','å¸‚åœºéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,17,'0,1,7,12,17,',11,'201014','æŠ€æœ¯éƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,12,'0,1,7,12,',12,'201020','æµå—å¸‚å†ä¸‹åŒºåˆ†å…¬å¸','1','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,22,'0,1,7,12,22,',12,'201021','å…¬å¸é¢†å¯¼','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,22,'0,1,7,12,22,',12,'201022','ç»¼åˆéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,22,'0,1,7,12,22,',12,'201023','å¸‚åœºéƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,22,'0,1,7,12,22,',12,'201024','æŠ€æœ¯éƒ¨','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `office_id` bigint(20) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `name` varchar(100) NOT NULL COMMENT 'è§’è‰²åç§°',
  `enname` varchar(255) DEFAULT NULL COMMENT 'è‹±æ–‡åç§°',
  `role_type` varchar(255) DEFAULT NULL COMMENT 'è§’è‰²ç±»å‹',
  `data_scope` char(1) DEFAULT NULL COMMENT 'æ•°æ®èŒƒå›´ï¼ˆ0ï¼šæ‰€æœ‰æ•°æ®ï¼›1ï¼šæ‰€åœ¨å…¬å¸åŠä»¥ä¸‹æ•°æ®ï¼›2ï¼šæ‰€åœ¨å…¬å¸æ•°æ®ï¼›3ï¼šæ‰€åœ¨éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®ï¼›4ï¼šæ‰€åœ¨éƒ¨é—¨æ•°æ®ï¼›8ï¼šä»…æœ¬äººæ•°æ®ï¼›9ï¼šæŒ‰æ˜ç»†è®¾ç½®ï¼‰',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='è§’è‰²è¡¨';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,1,'ç³»ç»Ÿç®¡ç†å‘˜','deptLeader','assignment','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'å…¬å¸ç®¡ç†å‘˜','hr','assignment','2',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,1,'æœ¬å…¬å¸ç®¡ç†å‘˜','c','assignment','3',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,1,'éƒ¨é—¨ç®¡ç†å‘˜','departAdmin','assignment','4',1,'2013-05-27 08:00:00',2,'2013-06-26 17:29:36',NULL,'0'),(5,1,'æœ¬éƒ¨é—¨ç®¡ç†å‘˜','e','assignment','5',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,1,'æ™®é€šç”¨æˆ·','f','assignment','8',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,7,'å±±ä¸œçœç®¡ç†å‘˜','g','assignment','9',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `menu_id` bigint(20) NOT NULL COMMENT 'èœå•ç¼–å·',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-èœå•';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(2,60),(2,61),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,58),(4,59),(4,60),(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(5,40),(5,41),(5,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,54),(5,55),(5,56),(5,57),(5,58),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(6,19),(6,20),(6,21),(6,22),(6,23),(6,24),(6,25),(6,26),(6,27),(6,28),(6,29),(6,30),(6,31),(6,32),(6,33),(6,34),(6,35),(6,36),(6,37),(6,38),(6,39),(6,40),(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(6,47),(6,48),(6,49),(6,50),(6,51),(6,52),(6,53),(6,54),(6,55),(6,56),(6,57),(6,58),(6,59),(6,60),(6,61),(6,62),(6,63),(6,64),(6,65),(6,66),(6,67),(6,68),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),(7,20),(7,21),(7,22),(7,23),(7,24),(7,25),(7,26),(7,27),(7,28),(7,29),(7,30),(7,31),(7,32),(7,33),(7,34),(7,35),(7,36),(7,37),(7,38),(7,39),(7,40),(7,41),(7,42),(7,43),(7,44),(7,45),(7,46),(7,47),(7,48),(7,49),(7,50),(7,51),(7,52),(7,53),(7,54),(7,55),(7,56),(7,57),(7,58),(7,59),(7,60),(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(7,68);

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` bigint(20) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `office_id` bigint(20) NOT NULL COMMENT 'æœºæ„ç¼–å·',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-æœºæ„';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values (7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),(7,20),(7,21),(7,22),(7,23),(7,24),(7,25),(7,26);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `company_id` bigint(20) NOT NULL COMMENT 'å½’å±å…¬å¸',
  `office_id` bigint(20) NOT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `login_name` varchar(100) NOT NULL COMMENT 'ç™»å½•å',
  `password` varchar(100) NOT NULL COMMENT 'å¯†ç ',
  `no` varchar(100) DEFAULT NULL COMMENT 'å·¥å·',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `mobile` varchar(200) DEFAULT NULL COMMENT 'æ‰‹æœº',
  `user_type` char(1) DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»å‹',
  `login_ip` varchar(100) DEFAULT NULL COMMENT 'æœ€åç™»é™†IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åç™»é™†æ—¶é—´',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·è¡¨';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`login_ip`,`login_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,1,1,'thinkgem','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','Thinkgem','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','æœ€é«˜ç®¡ç†å‘˜','0'),(2,1,1,'admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','ç®¡ç†å‘˜','thinkgem@163.com','8675','8675',NULL,'0:0:0:0:0:0:0:1','2013-07-17 12:13:16',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','ç®¡ç†å‘˜','0'),(3,1,3,'bj_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','ç»¼åˆéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','ç»¼åˆéƒ¨','0'),(4,1,4,'bj_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','å¸‚åœºéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','å¸‚åœºéƒ¨','0'),(5,1,5,'bj_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','æŠ€æœ¯éƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','æŠ€æœ¯éƒ¨','0'),(6,1,6,'bj_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','ç ”å‘éƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','ç ”å‘éƒ¨','0'),(7,7,8,'sd_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0007','å±±åˆ†é¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸é¢†å¯¼','0'),(8,7,9,'sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0008','å±±åˆ†ç»¼åˆéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸ç»¼åˆéƒ¨','0'),(9,7,10,'sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0009','å±±åˆ†å¸‚åœºéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸å¸‚åœºéƒ¨','0'),(10,7,11,'sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0010','å±±ä¸œçœåˆ†å…¬å¸æŠ€æœ¯éƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','å±±ä¸œçœåˆ†å…¬å¸æŠ€æœ¯éƒ¨','0'),(11,12,13,'sdjn_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0011','æµåˆ†å…¬å¸é¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','æµå—åˆ†å…¬å¸é¢†å¯¼','0'),(12,12,18,'sdjnlc_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0012','æµåˆ†å†åŸé¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','æµå—å¸‚å†åŸåŒºåˆ†å…¬å¸é¢†å¯¼','0'),(13,22,23,'sdjnlx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0013','æµåˆ†å†ä¸‹é¢†å¯¼','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','æµå—å¸‚å†ä¸‹åŒºåˆ†å…¬å¸é¢†å¯¼','0'),(14,22,24,'sdjnlx_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0014','æµåˆ†å†ä¸‹ç»¼åˆéƒ¨','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','æµå—å¸‚å†ä¸‹åŒºåˆ†å…¬å¸ç»¼åˆéƒ¨','0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT 'ç”¨æˆ·ç¼–å·',
  `role_id` bigint(20) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·-è§’è‰²';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,1),(3,2),(4,3),(5,4),(6,5),(7,2),(7,7),(8,2),(9,1),(10,2),(11,3),(12,4),(13,5),(14,6);

/*Table structure for table `t_aduit_info` */

DROP TABLE IF EXISTS `t_aduit_info`;

CREATE TABLE `t_aduit_info` (
  `AUDIT_ID` bigint(20) NOT NULL,
  `AUDIT_TYPE` char(1) NOT NULL COMMENT '0ï¼šåˆåŒå®¡æ ¸ 1ï¼šè´¢åŠ¡å®¡æ ¸  2ï¼šå…¥åº“å®¡æ ¸  3ï¼šå…¶å®ƒå®¡æ ¸ ',
  `CONTRACT_SID` bigint(20) DEFAULT NULL,
  `FEE_ITEM_ID` int(11) DEFAULT NULL,
  `AUDIT_STAFF_ID` varchar(6) NOT NULL,
  `AUDIT_NOTES` varchar(2048) DEFAULT NULL,
  `AUDIT_STS` char(1) NOT NULL COMMENT '0ï¼š æœªå®¡æ ¸ 1ï¼šå·²æäº¤å®¡æ ¸ 2ï¼šå®¡æ ¸é€šè¿‡ 3ï¼šå®¡æ ¸ä¸é€šè¿‡',
  `AUDIT_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åˆåŒå®¡æ ¸ã€è´¢åŠ¡å®¡æ ¸';

/*Data for the table `t_aduit_info` */

/*Table structure for table `t_coal_demand` */

DROP TABLE IF EXISTS `t_coal_demand`;

CREATE TABLE `t_coal_demand` (
  `DEMAND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEMAND_NAME` varchar(255) DEFAULT NULL,
  `CREATE_BY` bigint(20) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` bigint(20) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DEMAND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_demand` */

insert  into `t_coal_demand`(`DEMAND_ID`,`DEMAND_NAME`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`,`DEL_FLAG`,`REMARKS`) values (1,'å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº',2,'2013-07-11 11:43:22',2,'2013-07-11 11:43:22','1',NULL),(2,'å‘¼å’Œæµ©ç‰¹æ–°åå¹¿åœº',2,'2013-07-11 15:41:23',2,'2013-07-11 15:41:23','0','');

/*Table structure for table `t_coal_price` */

DROP TABLE IF EXISTS `t_coal_price`;

CREATE TABLE `t_coal_price` (
  `COAL_PRICE_ID` bigint(20) NOT NULL,
  `COAL_TYPE_ID` varchar(6) DEFAULT NULL COMMENT 'æ— çƒŸç…¤	WY\n             è´«ç…¤	PM\n             è´«ç˜¦ç…¤	PS\n             ç˜¦ç…¤	SM\n             ç„¦ç…¤	JM\n             è‚¥ç…¤	FM\n             1/3ç„¦ç…¤	1/3JM\n             æ°”è‚¥ç…¤	QF\n             æ°”ç…¤	QM\n             1/2ä¸­ç²˜ç…¤	1/2ZN\n             å¼±ç²˜ç…¤	RN\n             ä¸ç²˜ç…¤	BN\n             é•¿ç„°ç…¤	CY\n             è¤ç…¤	HM\n             ',
  `COAL_PRICE_OLD` varchar(8) DEFAULT NULL,
  `COAL_PRICE` varchar(8) DEFAULT NULL,
  `STS` char(1) DEFAULT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_price` */

/*Table structure for table `t_coal_supply` */

DROP TABLE IF EXISTS `t_coal_supply`;

CREATE TABLE `t_coal_supply` (
  `SUPPLY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUPPLY_NAME` varchar(255) DEFAULT NULL,
  `CREATE_BY` bigint(20) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` bigint(20) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SUPPLY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_supply` */

insert  into `t_coal_supply`(`SUPPLY_ID`,`SUPPLY_NAME`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`,`DEL_FLAG`,`REMARKS`) values (1,'å†…è’™å¤ç…¤çŸ¿',2,'2013-07-11 11:42:23',2,'2013-07-11 11:42:23','0',NULL);

/*Table structure for table `t_coal_ticket` */

DROP TABLE IF EXISTS `t_coal_ticket`;

CREATE TABLE `t_coal_ticket` (
  `TICKET_U_ID` bigint(20) NOT NULL,
  `BATCH_ID` int(11) DEFAULT NULL,
  `CONTRACT_ID` bigint(20) DEFAULT NULL,
  `SUPPLY_ID` varchar(6) DEFAULT NULL,
  `SEND_TYPE` char(1) DEFAULT NULL COMMENT '1ï¼šå‘å¾€è´§åœº 2ï¼šå‘å¾€æ¸¯å£ 3ï¼šå‘å¾€å®¢æˆ· 4ï¼šå‘å¾€å…¶ä»–',
  `GRANT_TYPE` char(1) DEFAULT NULL COMMENT '1ï¼šå‘é€è½¦é˜Ÿ 2ï¼šå‘æ”¾ä¸ªäºº',
  `PICKUP_ADDR` varchar(1024) DEFAULT NULL,
  `UNLOAD_ADDR` varchar(1024) DEFAULT NULL,
  `PICKUP_DATE` datetime DEFAULT NULL,
  `PICKUP_PERSION` varchar(24) DEFAULT NULL,
  `PICKUP_LINK` varchar(12) DEFAULT NULL,
  `TRANS_PRICE_ID` int(11) DEFAULT NULL,
  `TRANS_COUNT` int(11) DEFAULT NULL,
  `FACTORY` varchar(64) DEFAULT NULL,
  `TRUCK_TEAM` varchar(24) DEFAULT NULL,
  `PLATE_NO` varchar(32) DEFAULT NULL,
  `TICKET_PERSION` varchar(12) DEFAULT NULL,
  `TICKET_FALG` varchar(32) DEFAULT NULL,
  `TICKET_START_NO` bigint(20) DEFAULT NULL,
  `TICKET_END_NO` bigint(20) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_ticket` */

/*Table structure for table `t_coal_type` */

DROP TABLE IF EXISTS `t_coal_type`;

CREATE TABLE `t_coal_type` (
  `COAL_TYPE_ID` varchar(6) NOT NULL COMMENT 'æ— çƒŸç…¤	WY\n             è´«ç…¤	PM\n             è´«ç˜¦ç…¤	PS\n             ç˜¦ç…¤	SM\n             ç„¦ç…¤	JM\n             è‚¥ç…¤	FM\n             1/3ç„¦ç…¤	1/3JM\n             æ°”è‚¥ç…¤	QF\n             æ°”ç…¤	QM\n             1/2ä¸­ç²˜ç…¤	1/2ZN\n             å¼±ç²˜ç…¤	RN\n             ä¸ç²˜ç…¤	BN\n             é•¿ç„°ç…¤	CY\n             è¤ç…¤	HM\n             ',
  `VDAF` varchar(12) DEFAULT NULL,
  `GRL` varchar(12) DEFAULT NULL,
  `YMM` varchar(12) DEFAULT NULL,
  `B` varchar(12) DEFAULT NULL,
  `PM` varchar(12) DEFAULT NULL,
  `QGR` varchar(12) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å›½å®¶æ ‡å‡†åˆ†ç±»ï¼šå…¶ä¸­ç‚¼ç„¦ç…¤ç±»å 27ï¼65%ï¼Œéç‚¼ç„¦ç…¤ç±»å 72ï¼35%ï¼Œå‰è€…åŒ…æ‹¬æ°”ç…¤ï¼ˆå 13ï¼75%ï¼‰ï¼Œè‚¥ç…¤ï¼ˆ';

/*Data for the table `t_coal_type` */

/*Table structure for table `t_comp_info` */

DROP TABLE IF EXISTS `t_comp_info`;

CREATE TABLE `t_comp_info` (
  `COMP_ID` bigint(20) NOT NULL,
  `COMP_NAME` varchar(512) DEFAULT NULL,
  `CORPORATION` varchar(512) DEFAULT NULL,
  `LINK_PERSION` varchar(32) DEFAULT NULL,
  `LINK_PHONE` varchar(32) DEFAULT NULL,
  `COMP_ADDR` varchar(2048) DEFAULT NULL,
  `MAIL` varchar(32) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `ACCOUNT_ID` varchar(64) DEFAULT NULL,
  `BANK_ID` varchar(32) DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_comp_info` */

/*Table structure for table `t_contract` */

DROP TABLE IF EXISTS `t_contract`;

CREATE TABLE `t_contract` (
  `CONTRACT_SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTRACT_ID` varchar(100) NOT NULL COMMENT 'åˆåŒç¼–å·',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ç¼–å·',
  `CONTRACT_TYPE` char(1) NOT NULL COMMENT '1ï¼šé‡‡è´­åˆåŒ 2ï¼šé”€å”®åˆåŒ 3ï¼šè¿è¾“åˆåŒ',
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `SIGN_DATE` datetime NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `DEL_FLAG` char(1) NOT NULL COMMENT 'åˆ é™¤æ ‡è®°',
  `CREATE_BY` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¥æœŸ',
  `UPDATE_BY` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¥æœŸ',
  PRIMARY KEY (`CONTRACT_SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='åˆåŒç¼–å·è§„åˆ™ï¼šå¸‚å…¬å¸åç§°çš„é¦–å­—æ¯-æ‰¿åŠéƒ¨é—¨åç§°çš„é¦–å­—æ¯-å¹´æœˆæ—¥æ—¶é—´ï¼ˆåˆ†ï¼‰-å·ç ï¼ˆå››ä½ï¼‰ ç¤ºä¾‹';

/*Data for the table `t_contract` */

insert  into `t_contract`(`CONTRACT_SID`,`CONTRACT_ID`,`process_instance_id`,`CONTRACT_TYPE`,`STS`,`STS_DATE`,`REMARKS`,`SIGN_DATE`,`START_DATE`,`END_DATE`,`DEL_FLAG`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`) values (2,'Y6643234234',NULL,'1','0','2013-07-16 18:05:50','','2013-07-16 00:00:00','2013-07-16 00:00:00','2015-07-16 00:00:00','0',2,'2013-07-16 18:05:50',2,'2013-07-16 18:05:50');

/*Table structure for table `t_contract_act_info` */

DROP TABLE IF EXISTS `t_contract_act_info`;

CREATE TABLE `t_contract_act_info` (
  `CONTRACT_SID` bigint(20) NOT NULL,
  `ACT_TYPE` char(1) NOT NULL COMMENT '0  å®¡æ ¸  1 åˆåŒå˜æ›´ 2 åˆåŒå½’æ¡£ 3 åˆåŒä½œåºŸ',
  `ACT_NOTES` varchar(2048) DEFAULT NULL,
  `ACT_STAFF` varchar(6) NOT NULL,
  `ACT_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åˆåŒå˜æ›´ä¿¡æ¯ï¼ŒåŒ…æ‹¬å˜æ›´ï¼Œç»ˆæ­¢åˆåŒç­‰';

/*Data for the table `t_contract_act_info` */

/*Table structure for table `t_contract_file` */

DROP TABLE IF EXISTS `t_contract_file`;

CREATE TABLE `t_contract_file` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTRACT_SID` bigint(20) NOT NULL,
  `FILE_TYPE` char(1) DEFAULT NULL,
  `FILE_URL` varchar(256) DEFAULT NULL,
  `FILE_NAME` varchar(256) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='è®°å½•åˆåŒç›¸å…³æ–‡ä»¶ä¿¡æ¯ã€‚ä¸Šä¼ åˆåŒå‰¯æœ¬';

/*Data for the table `t_contract_file` */

insert  into `t_contract_file`(`ID`,`CONTRACT_SID`,`FILE_TYPE`,`FILE_URL`,`FILE_NAME`,`STS`,`STS_DATE`) values (1,1,NULL,'/upload/Y6643234234/2013071612310914632571225817.zip','2012å¹´ç»ˆå·¥ä½œæ€»ç»“æ¨¡æ¿.pptx','0','2013-07-16 12:31:09'),(2,1,NULL,'/upload/Y6643234234/201307161436139238911245256.zip','220417mhwhw4ic7necmnhx.jpg','0','2013-07-16 14:36:13'),(3,1,NULL,'/upload/Y6643234234/201307161506343228711407974.zip','CUCå¼•é¢†ä¸“å®¶ç”³è¯·è‡ªèææ–™ï¼åˆ˜åº†å®‡.ppt','0','2013-07-16 15:06:34');

/*Table structure for table `t_contract_info` */

DROP TABLE IF EXISTS `t_contract_info`;

CREATE TABLE `t_contract_info` (
  `CONTRACT_SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTRACT_ID` varchar(100) NOT NULL COMMENT 'åˆåŒç¼–å·',
  `PROCESS_INSTANCE_ID` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ç¼–å·',
  `CONTRACT_TYPE` char(1) NOT NULL COMMENT '1ï¼šé‡‡è´­åˆåŒ 2ï¼šé”€å”®åˆåŒ 3ï¼šè¿è¾“åˆåŒ',
  `SUPPLY_ID` bigint(20) DEFAULT NULL,
  `DEMAND_ID` bigint(20) DEFAULT NULL,
  `COAL_TYPE` char(1) DEFAULT NULL COMMENT 'ç…¤ç§',
  `CALORIE` int(10) DEFAULT NULL COMMENT 'çƒ­å¡',
  `PRICE` int(10) DEFAULT NULL COMMENT 'æ‰§è¡Œå•ä»·',
  `DELIVERY_PLACE` varchar(255) DEFAULT NULL COMMENT 'äº¤è´§åœ°ç‚¹',
  `TAX_FLAG` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å«ç¨ 0:ä¸å«  1:å«',
  `PAY_MODE` varchar(6) DEFAULT NULL COMMENT 'ç»“ç®—æ–¹å¼',
  `TRANS_TYPE` varchar(6) DEFAULT NULL COMMENT 'è¿è¾“ç±»å‹',
  `PAY_TYPE` varchar(6) DEFAULT NULL COMMENT 'ç»“ç®—ç±»å‹',
  `NUMBER` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL COMMENT 'å•ä½(åˆ†)',
  `FEE_STS` char(1) DEFAULT NULL COMMENT '0ï¼šå·²æ”¶ 1ï¼šå·²ä»˜ 2ï¼šæœªæ”¶ 3ï¼šæœªä»˜',
  `FEE_ITEM_ID` int(11) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `SIGN_DATE` datetime NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `DEL_FLAG` char(1) NOT NULL COMMENT 'åˆ é™¤æ ‡è®°',
  `CREATE_BY` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¥æœŸ',
  `UPDATE_BY` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¥æœŸ',
  PRIMARY KEY (`CONTRACT_SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='åˆåŒç¼–å·è§„åˆ™ï¼šå¸‚å…¬å¸åç§°çš„é¦–å­—æ¯-æ‰¿åŠéƒ¨é—¨åç§°çš„é¦–å­—æ¯-å¹´æœˆæ—¥æ—¶é—´ï¼ˆåˆ†ï¼‰-å·ç ï¼ˆå››ä½ï¼‰ ç¤ºä¾‹';

/*Data for the table `t_contract_info` */

insert  into `t_contract_info`(`CONTRACT_SID`,`CONTRACT_ID`,`PROCESS_INSTANCE_ID`,`CONTRACT_TYPE`,`SUPPLY_ID`,`DEMAND_ID`,`COAL_TYPE`,`CALORIE`,`PRICE`,`DELIVERY_PLACE`,`TAX_FLAG`,`PAY_MODE`,`TRANS_TYPE`,`PAY_TYPE`,`NUMBER`,`AMOUNT`,`FEE_STS`,`FEE_ITEM_ID`,`STS`,`STS_DATE`,`REMARKS`,`SIGN_DATE`,`START_DATE`,`END_DATE`,`DEL_FLAG`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`) values (2,'Y6643234234',NULL,'1',1,2,'1',23456,4000,'å†…è’™å¤æ–°æ¬¢å¹¿åœº','1','1','1','1',1000,5000000000,NULL,NULL,'0','2013-07-16 16:23:14','','2013-07-16 00:00:00','2013-07-16 00:00:00','2015-07-16 00:00:00','0',NULL,NULL,2,'2013-07-16 16:23:14');

/*Table structure for table `t_contract_item` */

DROP TABLE IF EXISTS `t_contract_item`;

CREATE TABLE `t_contract_item` (
  `CONTRACT_SID` bigint(20) NOT NULL,
  `ATTR_ID` varchar(256) NOT NULL,
  `ATTR_VALUE` varchar(1024) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åˆåŒå±æ€§ä¿¡æ¯ äº¤è´§åœ°ç‚¹ï¼šDELI_PLACE æ˜¯å¦å«ç¨ï¼šTAX_FLAG  0ï¼šå« 1ï¼šä¸å«\n                                     ';

/*Data for the table `t_contract_item` */

/*Table structure for table `t_contract_purchase` */

DROP TABLE IF EXISTS `t_contract_purchase`;

CREATE TABLE `t_contract_purchase` (
  `CONTRACT_SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUPPLY_ID` bigint(20) DEFAULT NULL,
  `DEMAND_ID` bigint(20) DEFAULT NULL,
  `COAL_TYPE` char(1) DEFAULT NULL COMMENT 'ç…¤ç§',
  `CALORIE` int(10) DEFAULT NULL COMMENT 'çƒ­å¡',
  `PRICE` int(10) DEFAULT NULL COMMENT 'æ‰§è¡Œå•ä»·',
  `DELIVERY_PLACE` varchar(255) DEFAULT NULL COMMENT 'äº¤è´§åœ°ç‚¹',
  `TAX_FLAG` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å«ç¨ 0:ä¸å«  1:å«',
  `PAY_MODE` varchar(6) DEFAULT NULL COMMENT 'ç»“ç®—æ–¹å¼',
  `NUMBER` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL COMMENT 'å•ä½(åˆ†)',
  PRIMARY KEY (`CONTRACT_SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='åˆåŒç¼–å·è§„åˆ™ï¼šå¸‚å…¬å¸åç§°çš„é¦–å­—æ¯-æ‰¿åŠéƒ¨é—¨åç§°çš„é¦–å­—æ¯-å¹´æœˆæ—¥æ—¶é—´ï¼ˆåˆ†ï¼‰-å·ç ï¼ˆå››ä½ï¼‰ ç¤ºä¾‹';

/*Data for the table `t_contract_purchase` */

insert  into `t_contract_purchase`(`CONTRACT_SID`,`SUPPLY_ID`,`DEMAND_ID`,`COAL_TYPE`,`CALORIE`,`PRICE`,`DELIVERY_PLACE`,`TAX_FLAG`,`PAY_MODE`,`NUMBER`,`AMOUNT`) values (2,1,2,'1',23456,4000,'å†…è’™å¤æ–°æ¬¢å¹¿åœº','0','1',1000,5000000000);

/*Table structure for table `t_cust` */

DROP TABLE IF EXISTS `t_cust`;

CREATE TABLE `t_cust` (
  `CUST_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_cust` */

/*Table structure for table `t_cust_rostor` */

DROP TABLE IF EXISTS `t_cust_rostor`;

CREATE TABLE `t_cust_rostor` (
  `CUST_ROSTER_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_cust_rostor` */

/*Table structure for table `t_cust_score` */

DROP TABLE IF EXISTS `t_cust_score`;

CREATE TABLE `t_cust_score` (
  `CUST_SCORE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_cust_score` */

/*Table structure for table `t_fee_item` */

DROP TABLE IF EXISTS `t_fee_item`;

CREATE TABLE `t_fee_item` (
  `FEE_ITEM_ID` bigint(20) NOT NULL,
  `FEE_TYPE` varchar(6) NOT NULL COMMENT '01ï¼šé‡‡è´­ç…¤æ¬¾ä»˜æ¬¾ 02ï¼šé‡‡è´­ç…¤æ¬¾é¢„ä»˜æ¬¾ 03ï¼šå…¶ä»–æ¬¾é¡¹ 11ï¼šé”€å”®ç…¤æ¬¾æ”¶æ¬¾ 12ï¼šé”€å”®ç…¤æ¬¾é¢„æ”¶æ¬¾ 13:ï¼šå…¶ä»–æ¬¾é¡¹ 03ï¼šè¿è¾“æ¬¾',
  `PRE_FLAG` char(1) DEFAULT NULL,
  `OLD_FEE` int(11) DEFAULT NULL,
  `FEE` int(11) DEFAULT NULL,
  `PAY_TYPE` char(1) DEFAULT NULL COMMENT '0ï¼šæ­£å¸¸æ”¯ä»˜ 1:åœ¨çº¿æ”¯ä»˜',
  `PAY_ID` int(11) DEFAULT NULL,
  `AUDIT_STS` char(1) DEFAULT NULL COMMENT '0ï¼š æœªå®¡æ ¸ 1ï¼šå·²æäº¤å®¡æ ¸ 2ï¼šå®¡æ ¸é€šè¿‡ 3ï¼šå®¡æ ¸ä¸é€šè¿‡',
  `AUDIT_ID` int(11) DEFAULT NULL,
  `FEE_STAFF_ID` varchar(6) NOT NULL,
  `FEE_DATE` datetime NOT NULL,
  `CONTRACT_SID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è´¢åŠ¡æ”¶ä»˜æ¬¾ï¼Œæ¶‰åŠæ‰€æœ‰è´¹ç”¨è®°å½•æµæ°´ã€‚';

/*Data for the table `t_fee_item` */

/*Table structure for table `t_fee_type` */

DROP TABLE IF EXISTS `t_fee_type`;

CREATE TABLE `t_fee_type` (
  `FEE_TYPE` varchar(6) NOT NULL COMMENT '01ï¼šé‡‡è´­ç…¤æ¬¾ä»˜æ¬¾ 02ï¼šé‡‡è´­ç…¤æ¬¾é¢„ä»˜æ¬¾ 03ï¼šå…¶ä»–æ¬¾é¡¹ 11ï¼šé”€å”®ç…¤æ¬¾æ”¶æ¬¾ 12ï¼šé”€å”®ç…¤æ¬¾é¢„æ”¶æ¬¾ 13:ï¼šå…¶ä»–æ¬¾é¡¹  03ï¼šè¿è¾“æ¬¾',
  `FEE_TYPE_NAME` varchar(32) NOT NULL,
  `PARENT_FEE_TYPE` varchar(6) DEFAULT NULL COMMENT '1ï¼šé‡‡è´­è´¹ç”¨ 2ï¼šé”€å”®è´¹ç”¨ 3ï¼šè¿è¾“è´¹ç”¨ 4ï¼šå…¶ä»–è´¹ç”¨',
  `PARENT_FEE_TYPE_NAME` varchar(32) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒ…æ‹¬æ‰€æœ‰æ¬¾é¡¹ï¼Œç…¤æ¬¾é‡‡è´­æ”¶ä»˜æ¬¾ï¼Œç…¤æ¬¾é”€å”®æ”¶ä»˜æ¬¾ï¼Œè¿è¾“æ”¶ä»˜æ¬¾ç­‰ã€‚';

/*Data for the table `t_fee_type` */

/*Table structure for table `t_load_item` */

DROP TABLE IF EXISTS `t_load_item`;

CREATE TABLE `t_load_item` (
  `LOAD_ITEM_ID` bigint(20) NOT NULL,
  `TICKET_U_ID` bigint(20) NOT NULL,
  `SEND_TYPE` char(1) DEFAULT NULL COMMENT '1ï¼šå‘å¾€è´§åœº 2ï¼šå‘å¾€æ¸¯å£ 3ï¼šå‘å¾€å®¢æˆ· 4ï¼šå‘å¾€å…¶ä»–',
  `FIELD_ID` varchar(32) DEFAULT NULL,
  `LOAD_DATE` datetime DEFAULT NULL,
  `COAL_TYPE_ID` varchar(6) DEFAULT NULL COMMENT 'æ— çƒŸç…¤	WY\n             è´«ç…¤	PM\n             è´«ç˜¦ç…¤	PS\n             ç˜¦ç…¤	SM\n             ç„¦ç…¤	JM\n             è‚¥ç…¤	FM\n             1/3ç„¦ç…¤	1/3JM\n             æ°”è‚¥ç…¤	QF\n             æ°”ç…¤	QM\n             1/2ä¸­ç²˜ç…¤	1/2ZN\n             å¼±ç²˜ç…¤	RN\n             ä¸ç²˜ç…¤	BN\n             é•¿ç„°ç…¤	CY\n             è¤ç…¤	HM\n             ',
  `AGENT` varchar(32) DEFAULT NULL,
  `SMS_FLAG` char(1) DEFAULT NULL,
  `SMS_PERSION` varchar(32) DEFAULT NULL,
  `SMS_PHONE` varchar(12) DEFAULT NULL,
  `SMS_NOTE` varchar(2048) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_load_item` */

/*Table structure for table `t_stock` */

DROP TABLE IF EXISTS `t_stock`;

CREATE TABLE `t_stock` (
  `STOCK_ID` bigint(20) NOT NULL COMMENT 'å‰äºŒä½æ˜¯å¤§ç±»ï¼Œåä¸‰ä½æ˜¯å•†å“åç§°ï¼ŒåäºŒä½æˆ–ä¸‰ä½æ˜¯è§„æ ¼',
  `STOCK_TYPE` varchar(6) NOT NULL,
  `FIELD_ID` varchar(32) DEFAULT NULL,
  `STORAGE_ID` varchar(32) DEFAULT NULL,
  `BATCH_ID` int(11) DEFAULT NULL,
  `COAL_NUM` int(11) DEFAULT NULL,
  `UNIT` varchar(6) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL COMMENT 'å•ä½(åˆ†)',
  `MAX_MUM` int(11) DEFAULT NULL,
  `MIN_MUM` int(11) DEFAULT NULL,
  `CURR_MUM` int(11) DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_stock` */

/*Table structure for table `t_stock_check` */

DROP TABLE IF EXISTS `t_stock_check`;

CREATE TABLE `t_stock_check` (
  `CHECK_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_stock_check` */

/*Table structure for table `t_ticker_detail` */

DROP TABLE IF EXISTS `t_ticker_detail`;

CREATE TABLE `t_ticker_detail` (
  `TICKET_DETAIL_ID` bigint(20) NOT NULL,
  `TICKET_ID` bigint(20) NOT NULL,
  `UNIT` varchar(6) DEFAULT NULL,
  `COAL_PRICE_ID` int(11) DEFAULT NULL,
  `COAL_CALOR` varchar(32) DEFAULT NULL,
  `TRUCK_TEAM` varchar(24) DEFAULT NULL,
  `PLATE_NO` varchar(32) DEFAULT NULL,
  `GROSS_WEIGHT` varchar(32) DEFAULT NULL,
  `TARE_WEIGHT` varchar(32) DEFAULT NULL,
  `NET_WEIGHT` varchar(32) DEFAULT NULL,
  `TO_GROSS_WEIGHT` varchar(32) DEFAULT NULL,
  `TO_TARE_WEIGHT` varchar(32) DEFAULT NULL,
  `TO_NET_WEIGHT` varchar(32) DEFAULT NULL,
  `LOSS_TON` varchar(32) DEFAULT NULL,
  `SURP_TON` varchar(32) DEFAULT NULL,
  `CUT_TON` varchar(32) DEFAULT NULL,
  `CUT_STAND` varchar(32) DEFAULT NULL,
  `BALANCE_TON` varchar(32) DEFAULT NULL,
  `CUT_NUM` int(11) DEFAULT NULL,
  `CHARGE` int(11) DEFAULT NULL,
  `BALANCE_FEE` int(11) DEFAULT NULL,
  `TRANS_FEE` int(11) DEFAULT NULL,
  `BALANCE_FRE` int(11) DEFAULT NULL,
  `CHECK_STAFF` varchar(32) DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_ticker_detail` */

/*Table structure for table `t_ticket` */

DROP TABLE IF EXISTS `t_ticket`;

CREATE TABLE `t_ticket` (
  `TICKET_ID` bigint(20) NOT NULL,
  `ACT_TYPE` char(1) NOT NULL COMMENT '0  å®¡æ ¸  1 åˆåŒå˜æ›´ 2 åˆåŒå½’æ¡£ 3 åˆåŒä½œåºŸ',
  `BATCH_ID` int(11) DEFAULT NULL,
  `CUST_ID` bigint(20) DEFAULT NULL,
  `CONTRACT_ID` bigint(20) DEFAULT NULL,
  `TICKET_U_ID` bigint(20) DEFAULT NULL,
  `SEND_ID` int(11) DEFAULT NULL,
  `POND_ID` bigint(20) DEFAULT NULL,
  `BALANCE_TON` varchar(32) DEFAULT NULL,
  `BALANCE_FEE` int(11) DEFAULT NULL,
  `BALANCE_FRE` int(11) DEFAULT NULL,
  `AGENT` varchar(32) DEFAULT NULL,
  `AGENT_LINK` varchar(12) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACT_TYPE  1ï¼šå…¥åº“ 2ï¼šå‡ºåº“';

/*Data for the table `t_ticket` */

/*Table structure for table `t_ticket_item` */

DROP TABLE IF EXISTS `t_ticket_item`;

CREATE TABLE `t_ticket_item` (
  `TICKET_ID` bigint(20) NOT NULL,
  `ATTR_ID` varchar(256) NOT NULL,
  `ATTR_VALUE` varchar(1024) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_ticket_item` */

/*Table structure for table `t_ticket_pond` */

DROP TABLE IF EXISTS `t_ticket_pond`;

CREATE TABLE `t_ticket_pond` (
  `POND_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_ticket_pond` */

/*Table structure for table `t_trans` */

DROP TABLE IF EXISTS `t_trans`;

CREATE TABLE `t_trans` (
  `TRANS_ID` bigint(20) NOT NULL,
  `TICKET_ID` bigint(20) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_trans` */

/*Table structure for table `t_trans_info` */

DROP TABLE IF EXISTS `t_trans_info`;

CREATE TABLE `t_trans_info` (
  `TRANS_TYPE_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_trans_info` */

/*Table structure for table `t_trans_price` */

DROP TABLE IF EXISTS `t_trans_price`;

CREATE TABLE `t_trans_price` (
  `TRANS_PRICE_ID` bigint(20) NOT NULL,
  `TRANS_PRICE_TYPE` char(1) NOT NULL COMMENT '1ï¼šç…¤çŸ¿-ç…¤åœº 2ï¼šç…¤çŸ¿-æ¸¯å£ 3ï¼šç…¤çŸ¿-å®¢æˆ· 4ï¼šç…¤åœº-ç…¤åœº 5ï¼šç…¤åœº-æ¸¯å£ 6ï¼šç…¤åœº-å®¢æˆ·',
  `COAL_FACTORY_TYPE` varchar(12) DEFAULT NULL,
  `TRANS_PRICE_OLD` varchar(8) DEFAULT NULL,
  `TRANS_PRICE` varchar(8) NOT NULL,
  `SMS_FLAG` char(1) DEFAULT NULL,
  `RECEIVER` varchar(24) DEFAULT NULL,
  `NOTICE` longtext,
  `START_DATE` datetime DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0ï¼šå·²å®¡æ ¸  1ï¼šå·²ç­¾è®¢ 2ï¼šæ‰§è¡Œä¸­ 3ï¼šå·²åˆ°æœŸ 4ï¼šå·²ä½œåºŸ 5ï¼šå·²è¿çº¦ 6:å½’æ¡£ 7:å·²å…³è”',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_trans_price` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
