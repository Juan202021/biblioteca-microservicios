-- Inicialización de la base de datos catalog_db
-- Crear tabla de libros si no existe (aunque Sequelize la crea, por si acaso)
CREATE TABLE IF NOT EXISTS books (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(20),
    editorial VARCHAR(255),
    year INTEGER,
    categories JSON,
    total_copies INTEGER DEFAULT 1,
    available_copies INTEGER DEFAULT 1,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos iniciales de ejemplo
INSERT INTO books (title, author, isbn, editorial, year, categories, total_copies, available_copies, description) VALUES
('Cien años de soledad', 'Gabriel García Márquez', '978-84-376-0494-7', 'Editorial Sudamericana', 1967, '["Novela", "Realismo mágico"]', 5, 5, 'Una saga familiar que narra la historia de la familia Buendía en el pueblo ficticio de Macondo.'),
('1984', 'George Orwell', '978-84-9838-076-0', 'Debolsillo', 1949, '["Distopía", "Ciencia ficción"]', 3, 3, 'Una novela distópica que explora temas de totalitarismo, vigilancia y control mental.'),
('El principito', 'Antoine de Saint-Exupéry', '978-84-204-0192-3', 'Salamandra', 1943, '["Infantil", "Filosofía"]', 10, 10, 'Un cuento filosófico sobre la vida, la amistad y el amor visto a través de los ojos de un niño.'),
('Don Quijote de la Mancha', 'Miguel de Cervantes', '978-84-670-1234-5', 'Penguin Clásicos', 1605, '["Clásico", "Aventura"]', 4, 4, 'La historia de un hidalgo que se vuelve loco leyendo libros de caballería y decide convertirse en caballero andante.'),
('Harry Potter y la piedra filosofal', 'J.K. Rowling', '978-84-7888-768-5', 'Salamandra', 1997, '["Fantasía", "Juvenil"]', 8, 8, 'El primer libro de la saga de Harry Potter, donde un niño descubre que es un mago.'),
('Clean Code: A Handbook of Agile Software Craftsmanship', 'Robert C. Martin', '978-0-13-235088-4', 'Prentice Hall', 2008, '["Ingeniería de Software", "Programación"]', 6, 6, 'Guía para escribir código limpio y mantenible en el desarrollo de software.'),
('The Pragmatic Programmer: Your Journey to Mastery', 'Andrew Hunt, David Thomas', '978-0-201-61622-4', 'Addison-Wesley', 1999, '["Ingeniería de Software", "Programación"]', 4, 4, 'Consejos prácticos para programadores profesionales sobre mejores prácticas y técnicas.'),
('Design Patterns: Elements of Reusable Object-Oriented Software', 'Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides', '978-0-201-63361-0', 'Addison-Wesley', 1994, '["Ingeniería de Software", "Patrones de Diseño"]', 5, 5, 'Catálogo de patrones de diseño orientados a objetos para resolver problemas comunes en software.'),
('Refactoring: Improving the Design of Existing Code', 'Martin Fowler', '978-0-201-48567-7', 'Addison-Wesley', 1999, '["Ingeniería de Software", "Refactorización"]', 3, 3, 'Técnicas para mejorar y reestructurar código existente sin cambiar su funcionalidad.'),
('Building Microservices: Designing Fine-Grained Systems', 'Sam Newman', '978-1-491-95035-7', 'O''Reilly Media', 2015, '["Ingeniería de Software", "Microservicios", "Arquitectura"]', 7, 7, 'Guía para diseñar y construir sistemas basados en microservicios.'),
('Domain-Driven Design: Tackling Complexity in the Heart of Software', 'Eric Evans', '978-0-321-12521-7', 'Addison-Wesley', 2003, '["Ingeniería de Software", "DDD", "Arquitectura"]', 4, 4, 'Enfoque para modelar software complejo basado en el dominio del negocio.'),
('Code Complete: A Practical Handbook of Software Construction', 'Steve McConnell', '978-0-7356-1967-8', 'Microsoft Press', 2004, '["Ingeniería de Software", "Programación"]', 5, 5, 'Manual completo sobre construcción de software, desde diseño hasta pruebas.'),
('Head First Design Patterns', 'Eric Freeman, Elisabeth Robson', '978-0-596-00712-6', 'O''Reilly Media', 2004, '["Ingeniería de Software", "Patrones de Diseño"]', 6, 6, 'Introducción visual y práctica a los patrones de diseño en programación orientada a objetos.'),
('The Clean Coder: A Code of Conduct for Professional Programmers', 'Robert C. Martin', '978-0-13-708107-3', 'Prentice Hall', 2011, '["Ingeniería de Software", "Profesionalismo"]', 4, 4, 'Guía ética y profesional para programadores, enfocada en responsabilidad y calidad.'),
('Agile Software Development, Principles, Patterns, and Practices', 'Robert C. Martin', '978-0-13-597444-5', 'Prentice Hall', 2002, '["Ingeniería de Software", "Agile"]', 3, 3, 'Principios y patrones para desarrollo ágil de software.'),
('Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation', 'Jez Humble, David Farley', '978-0-321-60191-9', 'Addison-Wesley', 2010, '["Ingeniería de Software", "DevOps", "CI/CD"]', 5, 5, 'Enfoque para automatizar el proceso de entrega de software de manera confiable.'),
('Site Reliability Engineering: How Google Runs Production Systems', 'Betsy Beyer, Chris Jones, Jennifer Petoff, Niall Richard Murphy', '978-1-491-92913-5', 'O''Reilly Media', 2016, '["Ingeniería de Software", "SRE", "Operaciones"]', 4, 4, 'Prácticas de Google para mantener sistemas confiables y escalables.'),
('The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win', 'Gene Kim, Kevin Behr, George Spafford', '978-1-942788-05-0', 'IT Revolution Press', 2013, '["Ingeniería de Software", "DevOps", "Gestión"]', 7, 7, 'Novela que ilustra los principios de DevOps y mejora de procesos IT.'),
('Accelerate: The Science of Lean Software and DevOps', 'Nicole Forsgren, Jez Humble, Gene Kim', '978-1-942788-28-9', 'IT Revolution Press', 2018, '["Ingeniería de Software", "DevOps", "Lean"]', 5, 5, 'Investigación basada en datos sobre prácticas que aceleran el desarrollo de software.'),
('Effective Java', 'Joshua Bloch', '978-0-321-35668-0', 'Addison-Wesley', 2008, '["Ingeniería de Software", "Java", "Programación"]', 6, 6, 'Mejores prácticas para programar en Java de manera efectiva.'),
('JavaScript: The Good Parts', 'Douglas Crockford', '978-0-596-51774-8', 'O''Reilly Media', 2008, '["Ingeniería de Software", "JavaScript", "Programación"]', 4, 4, 'Guía para usar las mejores características de JavaScript y evitar las problemáticas.'),
('You Don''t Know JS: Up & Going', 'Kyle Simpson', '978-1-491-90415-0', 'O''Reilly Media', 2015, '["Ingeniería de Software", "JavaScript", "Programación"]', 5, 5, 'Introducción a JavaScript para entender sus fundamentos.'),
('Database System Concepts', 'Abraham Silberschatz, Henry F. Korth, S. Sudarshan', '978-0-07-352332-3', 'McGraw-Hill', 2010, '["Ingeniería de Software", "Bases de Datos"]', 3, 3, 'Conceptos fundamentales de sistemas de bases de datos.');

-- Verificar que los datos se insertaron
SELECT COUNT(*) as total_books FROM books;