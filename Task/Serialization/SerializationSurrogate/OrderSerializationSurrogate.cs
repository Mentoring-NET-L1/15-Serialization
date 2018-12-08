using System.Runtime.Serialization;
using Task.DB;

namespace Task.Serialization.SerializationSurrogate
{
    internal class OrderSerializationSurrogate : ISerializationSurrogate
    {
        public void GetObjectData(object obj, SerializationInfo info, StreamingContext context)
        {
            var orderDetail = (Order)obj;
            info.AddValue(nameof(orderDetail.OrderID), orderDetail.OrderID);
            info.AddValue(nameof(orderDetail.CustomerID), orderDetail.CustomerID);
            info.AddValue(nameof(orderDetail.EmployeeID), orderDetail.EmployeeID);
            info.AddValue(nameof(orderDetail.OrderDate), orderDetail.OrderDate);
            info.AddValue(nameof(orderDetail.RequiredDate), orderDetail.RequiredDate);
        }

        public object SetObjectData(object obj, SerializationInfo info, StreamingContext context, ISurrogateSelector selector)
        {
            var order = (Order)obj;
            order.OrderID = info.GetInt32(nameof(order.OrderID));
            order.CustomerID = info.GetString(nameof(order.CustomerID));
            order.EmployeeID = info.GetInt32(nameof(order.EmployeeID));
            order.OrderDate = info.GetDateTime(nameof(order.OrderDate));
            order.RequiredDate = info.GetDateTime(nameof(order.RequiredDate));
            return order;
        }
    }
}
