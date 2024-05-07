module PriorAuthority
  class QuoteServices < ValueObject
    VALUES = [
      AE_CONSULTANT = new(:ae_consultant),
      ACCIDENT_RECONSTRUCTION = new(:accident_reconstruction),
      ACCOUNTANT = new(:accountant),
      ANAESTHETIST = new(:anaesthetist),
      ANIMAL_BEHAVIOURIST = new(:animal_behaviourist),
      ARCHITECT = new(:architect),
      BACK_CALCULATION = new(:back_calculation),
      BENEFIT_EXPERT = new(:benefit_expert),
      CARDIOLOGIST = new(:cardiologist),
      CELL_PHONE_SITE_ANALYSIS = new(:cell_phone_site_analysis),
      CHILD_PSYCHOLOGIST = new(:child_psychologist),
      COMPUTER_EXPERT = new(:computer_expert),
      CONSULTANT_ENGINEER = new(:consultant_engineer),
      COURT_TRANSCRIPTION = new(:court_transcription),
      CULTURAL_MUSIC_EXPERT = new(:cultural_music_expert),
      CULTURE_EXPERT = new(:culture_expert),
      DENTIST = new(:dentist),
      DERMATOLOGIST = new(:dermatologist),
      DISABILITY_CONSULTANT = new(:disability_consultant),
      DNA_REPORT = new(:dna_report),
      DOCTOR_GP = new(:doctor_gp),
      DRUG_EXPERT = new(:drug_expert),
      EMPLOYMENT_CONSULTANT = new(:employment_consultant),
      ENCRO_CHAT = new(:encro_chat),
      ENGINEERS_REPORT = new(:engineers_report),
      ENQUIRY_AGENT = new(:enquiry_agent),
      ENT_SURGEON = new(:ent_surgeon),
      ENVIRONMENTAL_EXPERT = new(:environmental_expert),
      FACIAL_MAPPING_EXPERT = new(:facial_mapping_expert),
      FINGERPRINT_EXPERT = new(:fingerprint_expert),
      FIRE_INVESTIGATION_REPORT = new(:fire_investigation_report),
      FIREARM_EXPERT = new(:firearm_expert),
      FORENSIC_PSYCHIATRIST = new(:forensic_psychiatrist),
      FORENSIC_SCIENTIST = new(:forensic_scientist),
      GENERAL_SURGEON = new(:general_surgeon),
      GENETICIST = new(:geneticist),
      GPS_RECORDS_REPORT = new(:gps_records_report),
      GYNAECOLOGIST = new(:gynaecologist),
      HAEMATOLOGIST = new(:haematologist),
      HANDWRITING_EXPERT = new(:handwriting_expert),
      HUMAN_TRAFFICKING = new(:human_trafficking),
      INDEPENDENT_SOCIAL_WORKER = new(:independent_social_worker),
      INTERMEDIARY = new(:intermediary),
      INTERPRETER = new(:interpreter),
      JEWELLERY_VALUATION = new(:jewellery_valuation),
      LAB_FEES = new(:lab_fees),
      LEGAL_PRISON_EXPERT = new(:legal_prison_expert),
      LIP_READER_SIGNER = new(:lip_reader_signer),
      MEDIATORS_FEES = new(:mediators_fees),
      MEDICAL_CONSULTANT = new(:medical_consultant),
      MEDICAL_MICROBIOLOGIST = new(:medical_microbiologist),
      MEDICAL_REPORT = new(:medical_report),
      METEOROLOGIST = new(:meteorologist),
      MIDWIFE = new(:midwife),
      MORTGAGE_EXPERTS_REPORT = new(:mortgage_experts_report),
      NEONATOLOGIST = new(:neonatologist),
      NEUROLOGISTS_REPORT = new(:neurologists_report),
      NEUROPATHOLOGIST = new(:neuropathologist),
      NEUROPSYCHIATRIST = new(:neuropsychiatrist),
      NEUROPSYCHOLOGIST = new(:neuropsychologist),
      NEURORADIOLOGIST = new(:neuroradiologist),
      NEUROSURGEON = new(:neurosurgeon),
      NURSING_EXPERT = new(:nursing_expert),
      OBSTETRICIAN = new(:obstetrician),
      OCCUPATIONAL_THERAPIST = new(:occupational_therapist),
      ONCOLOGIST = new(:oncologist),
      OPHTHALMOLOGIST = new(:ophthalmologist),
      ORTHOPAEDIC_SURGEON = new(:orthopaedic_surgeon),
      PAEDIATRICIAN_REPORT = new(:paediatrician_report),
      PATHOLOGIST_REPORT = new(:pathologist_report),
      PHARMACOLOGIST = new(:pharmacologist),
      PHOTOCOPYING = new(:photocopying),
      PHOTOGRAPHER = new(:photographer),
      PHYSIOTHERAPIST = new(:physiotherapist),
      PLANNING_EXPERT = new(:planning_expert),
      PLASTIC_SURGEON = new(:plastic_surgeon),
      PRIVATE_INVESTIGATOR = new(:private_investigator),
      PROCESS_SERVER = new(:process_server),
      PSYCHIATRIC_REPORT_PRISON_LAW = new(:psychiatric_report_prison_law),
      PSYCHIATRIST_INCLUDING_CHILD = new(:psychiatrist_including_child),
      PSYCHOLOGICAL_REPORT_PRISON_LAW = new(:psychological_report_prison_law),
      PSYCHOLOGIST = new(:psychologist),
      RADIOLOGIST = new(:radiologist),
      REPORT_WRITING = new(:report_writing),
      RHEUMATOLOGIST = new(:rheumatologist),
      RISK_ASSESSMENT_EXPERT = new(:risk_assessment_expert),
      SLEEP_EXPERT = new(:sleep_expert),
      SPECIALIST_BARRISTER = new(:specialist_barrister),
      SPEECH_THERAPIST = new(:speech_therapist),
      SURGEON = new(:surgeon),
      SURVEYOR = new(:surveyor),
      SURVEYORS_REPORT = new(:surveyors_report),
      TACHOGRAPH_EXPERT = new(:tachograph_expert),
      TELECOMMUNICATIONS_EXPERT = new(:telecommunications_expert),
      TOXICOLOGIST_REPORT = new(:toxicologist_report),
      TRANSCRIPTION_RECORDING = new(:transcription_recording),
      TRANSLATION_AND_TRANSCRIPTION = new(:translation_and_transcription),
      TRANSLATION_DOCUMENTS = new(:translation_documents),
      TRAVEL = new(:travel),
      UROLOGIST = new(:urologist),
      VETERINARY_REPORT = new(:veterinary_report),
      VOICE_RECOGNITION = new(:voice_recognition),
    ].freeze

    def translated
      I18n.t("helpers.quote_services.#{value}")
    end
  end
end
