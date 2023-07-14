MainOffence = Struct.new(:id, :description) do
  # rubocop:disable Metrics/MethodLength
  def self.all
    @all ||= [
      new('1', 'Assault (common)'),
      new('2', 'Battery (common)'),
      new('3', 'Assault occasioning actual bodily harm'),
      new('4', 'Wounding or inflicting grievous bodily harm'),
      new('5', 'Wounding or causing grievous bodily harm with intent'),
      new('6', 'Making threats to kill'),
      new('7', 'Racially aggravated assaults'),
      new('8', 'Assault on constable in execution of duty'),
      new('9', 'Resisting or wilfully obstructing constable'),
      new('10', 'Assault with intention to resist arrest'),
      new('11', 'Attempting to choke, suffocate, strangle etc'),
      new('12', 'Endangering the safety of railway passengers '),
      new('13', 'Causing bodily injury by explosives'),
      new('14',
          'Using gunpowder to explode, or sending to any person an explosive substance, or throwing corrosive fluid on a person, with intent to grievous bodily harm '),
      new('15', 'Placing explosives etc., with intent to do bodily injury to any person'),
      new('16', 'Making or having gunpowder etc., with intent to commit or enable any person to commit a felony'),
      new('17', 'Causing miscarriage by poison, instrument'),
      new('18', 'Supplying instrument etc. to cause miscarriage'),
      new('19', 'Concealment of birth'),
      new('20', 'Administering chloroform, laudanum etc.'),
      new('21', 'Administering poison etc. so as to endanger life'),
      new('22', 'Administering poison with intent to injure etc.'),
      new('23', 'Circumcision of females'),
      new('24', 'Kidnapping (common law)'),
      new('25', 'Hostage taking'),
      new('26', 'False imprisonment (common law)'),
      new('27', 'Torture'),
      new('28', 'Murder (common law)'),
      new('29', 'Manslaughter (common law)'),
      new('30', 'Causing death by dangerous driving'),
      new('31', 'Causing death by careless driving while under the influence of drink or drugs'),
      new('32', 'Aggravated vehicle taking resulting in death'),
      new('33', 'Killing in pursuance of suicide pact'),
      new('34', 'Complicity to suicide'),
      new('35', 'Soliciting to murder'),
      new('36', 'Child destruction'),
      new('37', 'Infanticide'),
      new('38', 'Abortion'),
      new('39', 'Supplying or procuring means for abortion'),
      new('40', 'Concealment of birth'),
      new('41', 'Possession of firearm without certificate'),
      new('42', 'Possession or acquisition of shotgun without certificate'),
      new('43', 'Dealing in firearms'),
      new('44', 'Shortening of shotgun or possession of shortened shotgun'),
      new('45', 'Possession or acquisition of certain prohibited weapons etc.'),
      new('46', 'Possession of firearm with intent to injure / endanger life'),
      new('47', 'Possession of firearm or imitation firearm with intent to cause fear of violence'),
      new('48', 'Use of firearm to resist arrest'),
      new('49', 'Possession of firearm with criminal intent'),
      new('50', 'Carrying loaded firearm in public place'),
      new('51', 'Possession of firearm without certificate '),
      new('52', 'Trespassing with a firearm'),
      new('53', 'Possession of firearms by person convicted of crime'),
      new('54', 'Acquisition by or supply of firearms to person denied them'),
      new('55', 'Failure to comply with certificate when transferring firearm'),
      new('56', 'Shortening of smooth bore gun'),
      new('57', 'Permitting an escape (common law)'),
      new('58', 'Rescue (common law)'),
      new('59', 'Escape (common law)'),
      new('60', 'Escaping from lawful custody without force (common law)'),
      new('61', 'Breach of prison (common law)'),
      new('62', 'Prison mutiny'),
      new('63', 'Assaulting prison officer whilst possessing firearm etc.'),
      new('64', 'Harbouring escaped prisoners'),
      new('65', 'Assisting prisoners to escape Terrorist Offences'),
      new('66', 'Offences under the Terrorism Act 2000'),
      new('67', 'Offences against international protection of nuclear material'),
      new('68', 'Offences under the Northern Ireland'),
      new('69', 'Offences under the Sexual Offences Act 2003'),
      new('70', 'Child abduction by connected person'),
      new('71', 'Child abduction by other person'),
      new('72', 'Keping brothel and related offences'),
      new('73', 'Keeping a disorderly house'),
      new('74', 'Soliciting'),
      new('75', 'Taking, having etc. indecent photographs of children'),
      new('76', 'Sexual intercourse with patients'),
      new('77', 'Ill treatment of persons of unsound mind'),
      new('78', 'Bigamy'),
      new('79', 'Abuse of position of trust'),
      new('80', 'Abandonment of children under two'),
      new('81', 'Cruelty to persons under 16'),
      new('82', 'Armed robbery'),
      new('83', 'Assault with weapon with intent to rob'),
      new('84', 'Burglary (domestic)'),
      new('85', 'Going equipped to steal'),
      new('86', 'Burglary (non-domestic)'),
      new('87', 'Aggravated burglary'),
      new('88', 'Criminal Damage'),
      new('89', 'Destroying or damaging property with the intention or recklessness as to endanger life'),
      new('90', 'Aggravated criminal damage'),
      new('91', 'Threats to destroy or damage property'),
      new('92', 'Racially aggravated criminal damage'),
      new('93', 'Possessing anything with intent to destroy or damage property'),
      new('94', 'Possessing bladed article / instrument'),
      new('95', 'Prohibition of the carrying of offensive weapons without lawful authority or reasonable excuse'),
      new('96', 'Arson'),
      new('97', 'Aggravated arson'),
      new('98', 'Racially aggravated arson'),
      new('99', 'Theft'),
      new('100', 'Taking conveyance without authority'),
      new('101', 'Taking or riding a pedal cycle without authority'),
      new('102', 'Aggravated vehicle taking'),
      new('103', 'Handling stolen goods'),
      new('104', 'Receiving property by another‚Äôs mistake'),
      new('105', 'Removal of articles from places open to the public'),
      new('106', 'Abstraction of electricity'),
      new('107', 'Making off without payment'),
      new('108', 'Fraud (common law)'),
      new('109', 'Forgery'),
      new('110', 'Copying a false instrument'),
      new('111', 'Using a false statement'),
      new('112', 'Using a copy of a false instrument'),
      new('113', 'Custody or control of false instruments etc.'),
      new('114', 'Offences relating to money orders, share certificates, passports etc, etc.'),
      new('115', 'Counterfeiting notes and coins'),
      new('116', 'Passing, etc. counterfeiting notes and coins'),
      new('117', 'Offences involving the custody/control of counterfeit notes and coins'),
      new('118', 'Making, custody or control of counterfeiting materials etc.'),
      new('119', 'Illegal importation'),
      new('120', 'Offences involving the making/custody/control of counterfeiting materials and implements'),
      new('121', 'Reproducing British currency'),
      new('122', 'Offences in making, etc., imitation of British coins'),
      new('123', 'Prohibition of importation of counterfeit note and coins'),
      new('124', 'Prohibition of exportation of counterfeit notes and coins'),
      new('125', 'Destruction of registers of births etc'),
      new('126', 'Making false entries in copies of registers sent to register'),
      new('127', 'Fraudulent evasion'),
      new('128', 'Obtaining services by deception'),
      new('129', 'Evasion of liability by deception'),
      new('130', 'Obtaining property by deception'),
      new('131', 'Obtaining a money transfer by deception'),
      new('132', 'Obtaining pecuniary advantage by deception'),
      new('133', 'False accounting'),
      new('134', 'Liability of company officers for offences of deception committed by the company'),
      new('135', 'False statements by company directors'),
      new('136', 'Suppression, etc. of documents'),
      new('137', 'Procuring execution of a valuable security by deception'),
      new('138', 'Advertising rewards for return of goods stolen or lost'),
      new('139', 'Dishonestly retaining a wrongful credit'),
      new('140', 'raudulent use of telecommunication system'),
      new('141',
          'Possession or supply of anything for fraudulent purpose in connection with use of telecommunication system'),
      new('142', 'Offences under the Companies Act 1985'),
      new('143', 'Insider dealing'),
      new('144', 'False declarations of insolvency in voluntary liquidations'),
      new('145', 'Concealment of property and failure to account for losses'),
      new('146', 'Concealment or falsification of books and papers'),
      new('147', 'False statements'),
      new('148', 'Fraudulent disposal of property'),
      new('149', 'Absconding with property'),
      new('150', 'Fraudulent dealing with property obtained on credit'),
      new('151', 'Undischarged bankrupt concerned in a company'),
      new('152', 'Failure to keep proper business accounts'),
      new('153', 'Misleading statements and practices'),
      new('154', 'Fraudulent inducement to make a deposit'),
      new('155', 'Counterfeiting customs documents'),
      new('156', 'Offences in relation to dies or stamps'),
      new('157', 'Counterfeiting of dies or marks'),
      new('158', 'Fraudulent application of trademark'),
      new('159', 'False application or use of trademarks'),
      new('160', 'Forgery of driving documents'),
      new('161', 'Forgery and misuse of driving documents'),
      new('162', 'Forgery etc. of licenses and other documents'),
      new('163', 'Mishandling or falsifying parking documents'),
      new('164', 'Forgery, Alteration etc. of documents etc.'),
      new('165', 'False records or entries relating to driver‚Äôs hours'),
      new('166', 'Forgery, alteration, fraud of licences etc.'),
      new('167', 'Forgery, alteration etc. of licenses, marks, trade plates etc'),
      new('168', 'Forgery of documents etc.'),
      new('169', 'Fraudulent evasion of agricultural levy'),
      new('170', 'Evasion of duty'),
      new('171', 'Trade description offences (9 offences)'),
      new('172', 'VAT offences'),
      new('173', 'Breach of any order made by a court'),
      new('174', 'Causing explosion likely to endanger life or property'),
      new('175', 'Attempt to cause explosion, making or keeping explosive etc.'),
      new('176', 'Making or possession of explosive under suspicious circumstances'),
      new('177', 'Bomb Hoaxes'),
      new('178', 'Contamination of goods with intent'),
      new('179', 'Placing wood etc. on railway'),
      new('180', 'Exhibiting false signals etc.'),
      new('181', 'Perjuries (7 offences)'),
      new('182', 'Offences akin to perjury'),
      new('183', 'Perverting the course of public justice (common law)'),
      new('184', 'Public nuisance (common law)'),
      new('185', 'Contempt of court (common law)'),
      new('186', 'Blackmail'),
      new('187', 'Corrupt transactions with agents'),
      new('188', 'Corruption (common law)'),
      new('189', 'Corruption in public office'),
      new('190', 'Embracery'),
      new('191', 'Fabrication of evidence with intent to mislead a tribunal (common law)'),
      new('192', 'Personation of jurors (common law)'),
      new('193', 'Concealing an arrestable offence'),
      new('194', 'Assisting offenders'),
      new('195', 'False evidence before European Court'),
      new('196', 'Intimidating a witness, juror etc.'),
      new('197', 'Harming, threatening to harm a witness, juror etc.'),
      new('198', 'Ticket touts'),
      new('199', 'Prejudicing a drug trafficking investigation'),
      new('200', 'Giving false statements to procure cremation'),
      new('201', 'False statement tendered under section 9 of the Criminal Justice Act 1967'),
      new('202', 'alse statement tendered under section 102 of the Magistrates‚Äô Courts Act 1980'),
      new('203', 'Making a false statement to obtain or resist interim possession order'),
      new('204', 'aking false statement to authorised officer'),
      new('205', 'Riot'),
      new('206', 'Violent disorder'),
      new('207', 'Affray'),
      new('208', 'Fear or provocation of violence'),
      new('209', 'Intentional harassment, alarm, or distress'),
      new('210', 'Harassment, alarm or distress'),
      new('211', 'Harassment of debtors'),
      new('212', 'ffence of harassment'),
      new('213', 'Putting people in fear of violence'),
      new('214', 'Breach of restraining order/injunction'),
      new('215', 'Racially aggravated public order offences'),
      new('216', 'Racially aggravated harassment etc.'),
      new('217', 'Using words or behaviour or displaying written material stirring up racial hatred'),
      new('218', 'Publishing or distributing written material stirring up racial hatred'),
      new('219', 'Public performance of play stirring up racial hatred'),
      new('220', 'Distributing, showing or playing a recording stirring up racial hatred'),
      new('221', 'Broadcasting programme stirring up racial hatred'),
      new('222', 'Possession of written material or recording stirring up racial hatred'),
      new('223', 'Possession of offensive weapon'),
      new('224', 'Possession of bladed article'),
      new('225', 'Criminal libel (common law)'),
      new('226', 'Blasphemy and blasphemous libel (common law)'),
      new('227', 'Sedition'),
      new('228', 'Indecent display'),
      new('229', 'Presentation of obscene performance'),
      new('230', 'Obstructing railway or carriage on railway'),
      new('231', 'Obscene articles intended for publication for gain'),
      new('232', 'Offences of publication of obscene matter'),
      new('233', 'Agreeing to indemnify sureties'),
      new('234', 'Absconding by person released on bail'),
      new('235', 'Personating for purposes of bail etc.'),
      new('236', 'Sending prohibited articles by post'),
      new('237', 'Impersonating Customs officer'),
      new('238', 'Obstructing Customs officer'),
      new('239',
          'Penalty on keepers of refreshment houses permitting drunkenness, disorderly conduct, or gaming, etc., therein '),
      new('240', 'Penalty on persons found drunk'),
      new('241', 'Drunkenness in a public place'),
      new('242', 'Drunk in a late night refreshment house'),
      new('243', 'Drunk while in charge of a child'),
      new('244', 'Drunk on an aircraft'),
      new('245', 'Intimidation or annoyance by violence or otherwise'),
      new('246', 'Offences affecting security'),
      new('247', 'Offences under the Official Secrets Act 1911, 1920 and 1989'),
      new('248', 'Unlawful interception of communications by public and private systems'),
      new('249', 'Disclosure of telecommunication messages'),
      new('250', 'Incitement to disaffection'),
      new('251', 'Restriction of importation and exportation of controlled drugs'),
      new('252', 'Producing or supplying a Class A, B or C drug'),
      new('253', 'Possession of controlled drugs'),
      new('254', 'Possession of a Class A, B or C drug with intent to supply'),
      new('255', 'Cultivation of cannabis plant'),
      new('256', 'Occupier knowingly permitting drugs offences etc.'),
      new('257', 'Activities relating to opium'),
      new('258', 'Prohibition of supply etc., of articles for administering or preparing controlled drugs'),
      new('259', 'Offences relating to the safe custody of controlled drugs'),
      new('260', 'Practitioner contravening drug supply regulations'),
      new('261', 'Incitement'),
      new('262',
          'Assisting in or inducing commission outside United Kingdom of offence punishable under a corresponding law'),
      new('263', 'Powers of entry, search and seizure'),
      new('264', 'Illegal importation of Class A, B or C drugs'),
      new('265', 'Fraudulent evasion of controls on Class A, B or C drugs'),
      new('266', 'Failure to disclose knowledge or suspicion of money laundering'),
      new('267', 'Tipping-off in relation to money laundering investigations'),
      new('268', 'Offences in relation to proceeds of drug trafficking'),
      new('269', 'Offences in relation to money laundering investigations'),
      new('270', 'Manufacture and supply of scheduled substances'),
      new('271', 'Drug Trafficking offences at sea'),
      new('272', 'Ships used for illicit traffic'),
      new('273', 'Making and preserving records of production and supply of certain scheduled substances'),
      new('274', 'Supply of intoxicating substance'),
      new('275', 'Dangerous driving'),
      new('276', 'Careless, and inconsiderate driving'),
      new('277', 'Driving, or being in charge, when under the influence of drink or drugs'),
      new('278', 'Driving or being in charge of a motor vehicle with excess alcohol'),
      new('279', 'Breath tests'),
      new('280', 'Provision of specimens for analysis'),
      new('281', 'Motor racing on highways'),
      new('282', 'Leaving vehicle in dangerous position'),
      new('283', 'Causing danger to road users'),
      new('284', 'Restriction of carriage of persons on motor cycles'),
      new('285', 'Failing to stop at school gate'),
      new('286', 'Failure to comply with indication given by traffic sign'),
      new('287', 'Directions to pedestrians'),
      new('288', 'Using vehicles in dangerous condition'),
      new('289', 'Contravention of construction and use regulations'),
      new('290', 'Using etc. motor vehicle without test certificate'),
      new('291', 'Driving otherwise than in accordance with a licence'),
      new('292', 'Driving after refusal or revocation of licence'),
      new('293', 'False declaration as to physical fitness'),
      new('294', 'Failure to notify disability'),
      new('295', 'Driving with uncorrected defective eyesight'),
      new('296', 'Driving while disqualified'),
      new('297', 'Using etc. motor vehicle without insurance'),
      new('298', 'Failure to produce driving licence, insurance etc'),
      new('299',
          'Failure to give, or giving false, name and address in case of dangerous or careless or inconsiderate driving or cycling'),
      new('300', 'Pedestrian contravening constable‚Äôs direction to stop to give name and address'),
      new('301', 'Failing to stop and failing to report accident'),
      new('302',
          'Duty of owner of motor vehicle to give information for verifying compliance with requirement of compulsory insurance or security'),
      new('303', 'Duty to give information as to identity of driver etc., in certain circumstances'),
      new('304', 'Street playgrounds'),
      new('305', 'Speeding'),
      new('306', 'Wanton or furious driving'),
      new('307', 'Interference with vehicles'),
      new('308', 'Other road traffic offences (including policing etc.)'),
      new('309', 'Proceedings for the making of anti-social behaviour orders, sex offender orders etc'),
      new('310', 'Failing to keep dogs under proper control resulting in injury and other dog offences'),
      new('311', 'Failing to keep dogs under proper control resulting in injury and other dog offences'),
      new('312', 'Hijacking of aircraft'),
      new('313', 'Destroying, damaging or endangering safety of aircraft'),
      new('314', 'Other acts endangering or likely to endanger safety of aircraft'),
      new('315', 'Offences in relation to certain dangerous articles'),
      new('316', 'Endangering safety at aerodromes Hijacking of ships'),
      new('317', 'Other offences under the Aviation and Maritime Security Act 1990'),
      new('318', 'Piracy'),
      new('319', 'Offences under the Football Spectators Act 1989'),
      new('320', 'Throwing of missiles'),
      new('321', 'Indecent or racialist chanting'),
      new('322', 'Going onto the playi:0ng area'),
      new('323', 'Offences in connection with alcohol on coaches and trains'),
      new('324', 'Offences in connection with alcohol, containers etc., at sports grounds'),
      new('325', 'Offences of cruelty (Protection of Animals)'),
      new('326', 'Penalties for abandonment of animals'),
      new('327', 'Offences (Wild Mammals Protection)'),
      new('328', 'Raves'),
      new('329', 'Offences affecting enjoyment of premises'),
      new('330', 'Unlawful eviction and harassment of occupier'),
      new('331', 'Use or threat of violence for purpose of securing entry to premises'),
      new('332', 'Adverse occupation of residential premises'),
      new('333', 'Trespassing during the currency of an interim possession order'),
      new('334', 'Interim possession orders'),
      new('335', 'Aggravated trespass'),
      new('336', 'Failure to leave or re-entry to land after police direction to leave'),
      new('337', 'Unauthorised campers'),
    ]
  end
  # rubocop:enable Metrics/MethodLength

  def name
    description.to_s
  end
end
