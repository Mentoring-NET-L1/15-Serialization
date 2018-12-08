using System;
using System.Collections.Generic;
using System.IO;
using BasicSerialization.Models;

namespace BasicSerialization.ConsoleApp
{
    internal class Program
    {
        private static void Main()
        {
            var bookRepository = new BookRepository();

            var newCatalog = new Catalog
            {
                Books = new List<Book>()
                {
                    new Book()
                    {
                        Id = "bk1",
                        Title = "Title1",
                        Author = "Author1",
                        Genre = "Gener1",
                        Publisher = "Publisher1",
                        PublishDate = DateTime.Today,
                        RegistrationDate = DateTime.Today,
                        Isbn = "Isbn1",
                        Description = "Description1",
                    },
                    new Book()
                    {
                        Id = "bk2",
                        Title = "Title2",
                        Author = "Author2",
                        Genre = "Gener2",
                        Publisher = "Publisher2",
                        PublishDate = DateTime.Today,
                        RegistrationDate = DateTime.Today,
                        Isbn = "Isbn2",
                        Description = "Description2",
                    }
                },
                Date = DateTime.Today,
            };
            using (var resultFile = File.Create("result.xml"))
            {
                bookRepository.Write(resultFile, newCatalog);
            }

            using (var xmlStream = File.OpenRead("books.xml"))
            {
                var catalog = bookRepository.Read(xmlStream);
                PrintProperty("Catalog", catalog.Date.ToString());
                foreach (var book in catalog.Books)
                {
                    PrintBook(book);
                }
            }
            Console.ReadLine();
        }

        private static void PrintBook(Book book)
        {
            PrintProperty("Id", book.Id);
            PrintProperty("Title", book.Title);
            PrintProperty("Author", book.Author);
            PrintProperty("Genre", book.Genre);
            PrintProperty("Publisher", book.Publisher);
            PrintProperty("PublishDate", book.PublishDate.ToString());
            PrintProperty("RegistrationDate", book.RegistrationDate.ToString());
            PrintProperty("Isbn", book.Isbn);
            PrintProperty("Description", book.Description);
        }

        private static void PrintProperty(string key, string value)
        {
            Console.WriteLine($"{key}: {value}");
        }
    }
}
