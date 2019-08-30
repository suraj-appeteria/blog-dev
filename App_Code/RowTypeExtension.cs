using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for RowTypeExtension
/// </summary>
public static class DataRowExtensions
{
    public static T GetCellValueByName<T>(this DataRow row, string columnName)
    {
        int index = row.Table.Columns.IndexOf(columnName);
        return (index < 0 || index > row.ItemArray.Count())
                  ? default(T)
                  : (T)row[index];
    }
}