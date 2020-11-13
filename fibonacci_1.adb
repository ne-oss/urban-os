--  {{Ada/Sourceforge|fibonacci_1.adb}}

pragma License (Gpl);
pragma Ada_95;

with Ada.Text_IO;
with Ada.Command_Line;

procedure Fibonacci_1 is

   type Integer_Type is range 0 .. 999_999_999_999_999_999;

   package CL renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Integer_Type);

   function Fib (N : Integer_Type) return Integer_Type;

   Last  : Positive;
   Value : Integer_Type;

   function Fib (N : Integer_Type) return Integer_Type is
   begin
      if N = 0 then
         return 0;
      elsif N = 1 then
         return 1;
      else
         return Fib (N - 1) + Fib (N - 2);
      end if;
   end Fib;

begin
   I_IO.Get
     (From => CL.Argument (1),
      Item => Value,
      Last => Last);

   T_IO.Put ("The Fibonacci of ");
   I_IO.Put
     (Item  => Value,
      Width => 3,
      Base  => I_IO.Default_Base);
   T_IO.Put (" is ");
   I_IO.Put
     (Item  => Fib (Value),
      Width => I_IO.Default_Width,
      Base  => I_IO.Default_Base);

   return;
end Fibonacci_1;

----------------------------------------------------------------------------
--  $Author: krischik $
--
--  $Revision: 226 $
--  $Date: 2007-12-02 15:11:44 +0000 (Sun, 02 Dec 2007) $
--
--  $Id: fibonacci_1.adb 226 2007-12-02 15:11:44Z krischik $
--  $HeadURL: file:///svn/p/wikibook-ada/code/trunk/demos/Source/fibonacci_1.adb $
----------------------------------------------------------------------------
--  vim:  textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab
--  vim:  filetype=ada encoding=utf-8 fileformat=unix foldmethod=indent
