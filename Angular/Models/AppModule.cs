namespace Angular.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class AppModule
    {
        private string _name;
        private string _description;
        private int _id;
        /// <summary>
        /// 
        /// </summary>
        public string Name { get { return this._name; } set { this._name = value; } }
        /// <summary>
        /// 
        /// </summary>
        public string Description { get { return this._description; } set { this._description = value; } }
        /// <summary>
        /// 
        /// </summary>
        public int Id { get { return this._id; } set { this._id = value; } }
    }
    /// <summary>
    /// 
    /// </summary>
    public static class ModuleType
    {
        /// <summary>
        /// 
        /// </summary>
        public const int AccountModule = 1;
        /// <summary>
        /// 
        /// </summary>
        public const int CustomerModule = 2;
        /// <summary>
        /// 
        /// </summary>
        public const int NewsModule = 3;
    }
    /// <summary>
    /// 
    /// </summary>
    public static class ActionType
    {
        /// <summary>
        /// 
        /// </summary>
        public const int Addition = 1;
        /// <summary>
        /// 
        /// </summary>
        public const int Edit = 2;
        /// <summary>
        /// 
        /// </summary>
        public const int Delete = 3;
        /// <summary>
        /// 
        /// </summary>
        public const int View = 4;
        /// <summary>
        /// 
        /// </summary>
        public const int CanActive = 5;
    }
    /// <summary>
    /// 
    /// </summary>
    public static class RoleCollection
    {
        /// <summary>
        /// 
        /// </summary>
        public const int Superadmin = 0;
        /// <summary>
        /// 
        /// </summary>
        public const int Admin = 1;
        /// <summary>
        /// 
        /// </summary>
        public const int Manager = 2;
        /// <summary>
        /// 
        /// </summary>
        public const int Writer = 3;
        /// <summary>
        /// 
        /// </summary>
        public const int Guest = 4;
    }
}