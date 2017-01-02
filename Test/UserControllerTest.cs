﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Web;
using Web.Controllers;
using System.Web.Mvc;

namespace Test
{
    [TestClass]
    public class UserControllerTest
    {
        [TestMethod]
        public void AvatarTest()
        {
            var user = new UserController();
            ContentResult result = user.Avatar(0) as ContentResult;
            Assert.AreEqual("Resim bulunamadı",result);
        }

        [TestMethod]
        public void LoginTest()
        {
            Assert.AreEqual(1, 1);
        }
    }
}
