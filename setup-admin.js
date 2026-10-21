import pg from 'pg';import bcrypt from 'bcryptjs';
const {DATABASE_URL,ADMIN_EMAIL,ADMIN_PASSWORD}=process.env;
if(!DATABASE_URL||!ADMIN_EMAIL||!ADMIN_PASSWORD||ADMIN_PASSWORD.length<16)throw Error('Set DATABASE_URL, ADMIN_EMAIL and strong ADMIN_PASSWORD (16+ chars) in environment');
const pool=new pg.Pool({connectionString:DATABASE_URL,ssl:{rejectUnauthorized:true}});
const password_hash=await bcrypt.hash(ADMIN_PASSWORD,12);
await pool.query('INSERT INTO admins(email,password_hash) VALUES ($1,$2) ON CONFLICT(email) DO UPDATE SET password_hash=EXCLUDED.password_hash',[ADMIN_EMAIL.toLowerCase(),password_hash]);
await pool.end();console.log('HR admin account provisioned');
