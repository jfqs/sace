# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Starting with periods"
Period.create([{year: 2015}, {year: 2015, bimester: 1}, {year: 2015, bimester: 2}, {year: 2015, bimester: 3}, {year: 2015, bimester: 4}, {year: 2016, state: 1}, {year: 2016, bimester: 1, state: 1}, {year: 2016, bimester: 2}, {year: 2016, bimester: 3}, {year: 2016, bimester: 4}])
puts "Created periods"

puts "Creating admin"
Admin.create!({
    dni: Faker::Number.number(8),
    p_lastname: "admin",
    m_lastname: "admin",
    first_name: "admin",
    email: "admin@sace.com",
    password: "adminadmin",
    address: "dirtest-sec",
    phone: "11111"
  })

3.times do |i|
  Secretary.create!({
    dni: Faker::Number.number(8),
    p_lastname: Faker::Name.last_name,
    m_lastname: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    email: "secretaria-#{i}@gmail.com",
    password: "12345678",
    address: "dirtest-sec",
    phone: "11111"
  })
end

5.times do |i|
  Teacher.create!({
    dni: Faker::Number.number(8),
    p_lastname: Faker::Name.last_name,
    m_lastname: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    email: "profesor-#{i}@gmail.com",
    password: "12345678",
    address: "dirtest-sec",
    phone: "11111"
  })
end

20.times do |i|
  s_h = {}
  (1+rand(3)).times do |s|
    s_h[(s-1).to_s] = {
      dni: Faker::Number.number(8),
      p_lastname: Faker::Name.last_name,
      m_lastname: Faker::Name.last_name,
      first_name: Faker::Name.first_name,
      email: "hijo-#{i}#{s}@gmail.com",
      password: "12345678",
      address: "dirtest-hijo",
      phone: "11111"
    }
  end
  Guardian.create({
    dni: Faker::Number.number(8),
    p_lastname: Faker::Name.last_name,
    m_lastname: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    email: "padre-#{i}@gmail.com",
    password: "12345678",
    address: "dirtest-padre",
    phone: "11111",
    students_attributes: s_h
  })
end

puts "Tipo de pago"
PaymentType.create(name: "Matricula", amount: 1000)
["Abr","May","Jun","Jul","Ago","Set","Oct", "Nov","Dic"].each do |month|
  PaymentType.create(name: "Mensualidad #{month}", amount: 200)
end

puts "Salones: Niveles, grados, secciones"
p = EducationLevel.create(name: "Primaria")
(1..6).each do |n|
  g = EducationDegree.create(education_level_id: p.id, name: n.to_s)
  Section.create(education_degree_id: g.id, name: "A")
end
s = EducationLevel.create(name: "Secundaria")
(1..5).each do |n|
  g = EducationDegree.create(education_level_id: s.id, name: n.to_s)
  Section.create(education_degree_id: g.id, name: "A")
end

puts "Creando cursos"
["Lenguaje", "Matematica", "Geografia", "Historia", "Arte"].each do |c|
  Course.create(name: c)
end

Section.all.each do |section|
  Course.all.each do |course|
    ProgrammedSection.create(period_id: 6,
      section_id: section.id,
      course_id: course.id,
      teacher_id: Teacher.find_by_email("profesor-#{i}@gmail.com").id)
  end
end
puts "Creando tipo de nota"
["Cuaderno","Intervencion Oral","Practica","Examen"].each do |gt|
  GradeType.create(name: gt)
end
