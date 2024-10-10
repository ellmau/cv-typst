//#import "@preview/modern-acad-cv:0.1.0": *
#import "modern-acad-cv.typ":*

#let metadata = yaml("metadata.yaml")
#let multilingual = yaml("data/i18n.yaml")

#let infoline = yaml("data/infoline.yaml")
#let education = yaml("data/education.yaml")
#let feducation = yaml("data/feducation.yaml")
#let work = yaml("data/work.yaml")
#let skills = yaml("data/skills.yaml")
#let awards = yaml("data/awards.yaml")
#let volunteering = yaml("data/volunteering.yaml")
#let reviewing = yaml("data/reviewing.yaml")
#let professional = yaml("data/prof_act.yaml")
#let teach_responsible = yaml("data/teaching/responsible.yaml")
#let teach_courses = yaml("data/teaching/courses.yaml")
#let superv = yaml("data/teaching/cosuper.yaml")
#let stud_ass = yaml("data/teaching/ass.yaml")

//#let language = "de"

#let extraData() = {
  
}


#let my-cv(language: "de",body)=[

#let headerLabs = create-headers(multilingual, lang: language)

#show: modern-acad-cv.with(
  metadata, 
  multilingual,
  lang: language,   
  font: "Noto Sans Bhaiksuki",
  show-date: true
)

#let extra_data = ()
#for (entry,field) in metadata.personal.extras{
  let icon =  if field.keys().contains("icon"){
    fa-icon(field.at("icon"),fill:rgb(metadata.colors.main_color))
  }
  extra_data.push(
     [#icon #field.at("content")]
  )
}
#align(center+top)[
  #extra_data.join(" | ")
]

#line(length:100%, stroke: (paint:rgb(metadata.colors.main_color)))
#align(center + top)[
  #eval(metadata.personal.pitch,mode:"markup")
]
//#cv-auto(infoline,multilingual,lang:language)

= #headerLabs.at("work")

#cv-auto-stc(work,multilingual,lang:language)

#pagebreak(weak:true)

= #headerLabs.at("education")

#cv-auto-stc(education, multilingual, lang: language) 

= #headerLabs.at("feducation")

#cv-auto-stc(feducation,multilingual,lang:language)

#if language == "de"{
  pagebreak(weak: true)
}
#if language == "en" {
  pagebreak(weak:true)
}
= #headerLabs.at("skills")

#cv-auto-list(skills, multilingual,lang:language)

#if language == "de"{
  cv-cols[Sprachen][
    #table(
      columns: (15%,40%),
      stroke: none,
      inset: 0pt,
      row-gutter: 0.9em,
    )[Deutsch][Muttersprache][Englisch][verhandlungssicher]
  ]
}else if language == "en"{
    cv-cols[Languages][
    #table(
      columns: (15%,40%),
      stroke: none,
      inset: 0pt,
      row-gutter: 0.9em,
    )[German][native tongue][English][fluent]
  ]
}

= #headerLabs.at("awards")
#cv-auto(awards,multilingual,lang:language)

= #headerLabs.at("volunteering")
#cv-auto(volunteering,multilingual,lang:language)

= #headerLabs.at("acad")
== #headerLabs.at("reviewing")
#cv-auto(reviewing,multilingual,lang:language)


#if language == "de"{
  pagebreak(weak: true)
}
#if language == "en"{
  pagebreak(weak: true)
}
== #headerLabs.at("scientific")
#cv-auto(professional,multilingual,lang:language)

= #headerLabs.at("teaching")
== #headerLabs.at("teaching_resp")
#cv-auto(teach_responsible,multilingual,lang:language)
== #headerLabs.at("courses")
#cv-auto-stc(teach_courses,multilingual,lang:language)

== #headerLabs.at("cosuper")
#cv-auto(superv,multilingual,lang:language)

== #headerLabs.at("teaching_assistance")
#cv-auto(stud_ass,multilingual,lang:language)
]

#show: my-cv.with(language:"de")