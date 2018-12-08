using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace BasicSerialization.Models
{
    [XmlRoot("catalog", Namespace = "http://library.by/catalog")]
    public class Catalog
    {
        public Catalog()
        {
            Books = new List<Book>();
        }

        [XmlAttribute("date", DataType = "date")]
        public DateTime Date { get; set; }

        [XmlElement("book")]
        public List<Book> Books { get; set; }
    }
}
