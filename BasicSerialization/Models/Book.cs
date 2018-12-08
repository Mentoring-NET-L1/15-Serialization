using System;
using System.Xml.Serialization;

namespace BasicSerialization.Models
{
    [XmlType("book")]
    public class Book
    {
        [XmlAttribute("id")]
        public string Id { get; set; }

        [XmlElement("title")]
        public string Title { get; set; }

        [XmlElement("author")]
        public string Author { get; set; }

        [XmlElement("gener")]
        public string Genre { get; set; }

        [XmlElement("description")]
        public string Description { get; set; }

        [XmlElement("publisher")]
        public string Publisher { get; set; }

        [XmlElement("publish_date", DataType = "date")]
        public DateTime PublishDate { get; set; }

        [XmlElement("registration_date", DataType = "date")]
        public DateTime RegistrationDate { get; set; }

        [XmlElement("isbn")]
        public string Isbn { get; set; }
    }
}
