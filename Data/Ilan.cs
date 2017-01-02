//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ilan
    {
        public Ilan()
        {
            this.Comment = new HashSet<Comment>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Fiyat { get; set; }
        public int MetreKare { get; set; }
        public System.DateTime Tarih { get; set; }
        public byte[] Resim { get; set; }
        public int UserId { get; set; }
        public int KategoriId { get; set; }
        public int IlanDetayId { get; set; }
    
        public virtual Kategori Kategori { get; set; }
        public virtual IlanDetay IlanDetay { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Comment> Comment { get; set; }
    }
}