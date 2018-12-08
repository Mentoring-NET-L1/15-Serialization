using System;
using System.Data.Entity.Core.Objects;

namespace Task.Serialization.SerializationSurrogate
{
    internal class SerializationContext
    {
        public ObjectContext ObjectContext { get; set; }

        public Type TypeToSerialize { get; set; }
    }
}
