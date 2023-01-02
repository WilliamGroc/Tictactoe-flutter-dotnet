using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using tictactoe_back.Models;

namespace tictactoe_back.Services
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class GameService: IGameService
    {

        public GameService()
        {
        }

        public string[] initSession(string name)
        {
            return GameSessions.getInstance().createSession(name);
        }

        public string[] doMove(string name)
        {
            string[] state = GameSessions.getInstance().updateSession(name, 0, "X");

            return state;
        }

        public string[] getState(string name)
        {
            return GameSessions.getInstance().getSession(name);
        }

        public void stopSession(string name)
        {
            GameSessions.getInstance().removeSession(name);
        }
    }
}

