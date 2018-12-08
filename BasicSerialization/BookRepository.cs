using System;
using System.IO;
using System.Xml.Serialization;
using BasicSerialization.Models;

namespace BasicSerialization
{
    public class BookRepository
    {
        public Catalog Read(Stream xmlStream)
        {
            if (xmlStream == null)
                throw new ArgumentNullException(nameof(xmlStream));

            var serializer = new XmlSerializer(typeof(Catalog));
            return (Catalog)serializer.Deserialize(xmlStream);
        }

        public void Write(Stream xmlStream, Catalog catalog)
        {
            if (xmlStream == null)
                throw new ArgumentNullException(nameof(xmlStream));
            if (catalog == null)
                throw new ArgumentNullException(nameof(catalog));

            var serializer = new XmlSerializer(typeof(Catalog));
            serializer.Serialize(xmlStream, catalog);
        }
    }
}
