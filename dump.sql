PGDMP                   	    |            postgres     14.13 (Debian 14.13-1.pgdg120+1)    17.0 ?    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            t           1262    13780    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                     postgres    false            u           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    3444                        2615    20234    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                     postgres    false            v           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                        postgres    false    5            w           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                        postgres    false    5            �            1259    20235    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap r       postgres    false    5            �            1259    20245    accounts    TABLE     �  CREATE TABLE public.accounts (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    nickname character varying DEFAULT ''::character varying NOT NULL,
    password character varying DEFAULT ''::character varying NOT NULL,
    image character varying DEFAULT ''::character varying NOT NULL,
    "apiToken" character varying DEFAULT ''::character varying NOT NULL,
    note integer DEFAULT 0 NOT NULL,
    role character varying DEFAULT ''::character varying NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(6) with time zone NOT NULL
);
    DROP TABLE public.accounts;
       public         heap r       postgres    false    5            �            1259    20244    accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public               postgres    false    211    5            x           0    0    accounts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
          public               postgres    false    210            �            1259    20262    attachments    TABLE       CREATE TABLE public.attachments (
    id integer NOT NULL,
    "isShare" boolean DEFAULT false NOT NULL,
    "sharePassword" character varying DEFAULT ''::character varying NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    path character varying DEFAULT ''::character varying NOT NULL,
    size numeric DEFAULT 0 NOT NULL,
    "noteId" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(6) with time zone NOT NULL
);
    DROP TABLE public.attachments;
       public         heap r       postgres    false    5            �            1259    20261    attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.attachments_id_seq;
       public               postgres    false    5    213            y           0    0    attachments_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;
          public               postgres    false    212            �            1259    20278    config    TABLE     �   CREATE TABLE public.config (
    id integer NOT NULL,
    key character varying DEFAULT ''::character varying NOT NULL,
    config json
);
    DROP TABLE public.config;
       public         heap r       postgres    false    5            �            1259    20277    config_id_seq    SEQUENCE     �   CREATE SEQUENCE public.config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.config_id_seq;
       public               postgres    false    5    215            z           0    0    config_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.config_id_seq OWNED BY public.config.id;
          public               postgres    false    214            �            1259    20288    notes    TABLE     j  CREATE TABLE public.notes (
    id integer NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    content character varying DEFAULT ''::character varying NOT NULL,
    "isArchived" boolean DEFAULT false NOT NULL,
    "isRecycle" boolean DEFAULT false NOT NULL,
    "isShare" boolean DEFAULT false NOT NULL,
    "isTop" boolean DEFAULT false NOT NULL,
    "sharePassword" character varying DEFAULT ''::character varying NOT NULL,
    metadata json,
    users integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(6) with time zone NOT NULL
);
    DROP TABLE public.notes;
       public         heap r       postgres    false    5            �            1259    20287    notes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.notes_id_seq;
       public               postgres    false    5    217            {           0    0    notes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;
          public               postgres    false    216            �            1259    20328    scheduledTask    TABLE       CREATE TABLE public."scheduledTask" (
    id integer NOT NULL,
    name text NOT NULL,
    schedule text NOT NULL,
    "lastRun" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isSuccess" boolean DEFAULT true NOT NULL,
    output text
);
 #   DROP TABLE public."scheduledTask";
       public         heap r       postgres    false    5            �            1259    20327    scheduledTask_id_seq    SEQUENCE     �   CREATE SEQUENCE public."scheduledTask_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."scheduledTask_id_seq";
       public               postgres    false    5    223            |           0    0    scheduledTask_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."scheduledTask_id_seq" OWNED BY public."scheduledTask".id;
          public               postgres    false    222            �            1259    20306    tag    TABLE     h  CREATE TABLE public.tag (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    icon character varying DEFAULT ''::character varying NOT NULL,
    parent integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(6) with time zone NOT NULL
);
    DROP TABLE public.tag;
       public         heap r       postgres    false    5            �            1259    20305 
   tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.tag_id_seq;
       public               postgres    false    219    5            }           0    0 
   tag_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;
          public               postgres    false    218            �            1259    20319 
   tagsToNote    TABLE     �   CREATE TABLE public."tagsToNote" (
    id integer NOT NULL,
    "noteId" integer DEFAULT 0 NOT NULL,
    "tagId" integer DEFAULT 0 NOT NULL
);
     DROP TABLE public."tagsToNote";
       public         heap r       postgres    false    5            �            1259    20318    tagsToNote_id_seq    SEQUENCE     �   CREATE SEQUENCE public."tagsToNote_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."tagsToNote_id_seq";
       public               postgres    false    221    5            ~           0    0    tagsToNote_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."tagsToNote_id_seq" OWNED BY public."tagsToNote".id;
          public               postgres    false    220            �           2604    20354    accounts id    DEFAULT     j   ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    211    210    211            �           2604    20355    attachments id    DEFAULT     p   ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);
 =   ALTER TABLE public.attachments ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    212    213    213            �           2604    20356 	   config id    DEFAULT     f   ALTER TABLE ONLY public.config ALTER COLUMN id SET DEFAULT nextval('public.config_id_seq'::regclass);
 8   ALTER TABLE public.config ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    215    214    215            �           2604    20357    notes id    DEFAULT     d   ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);
 7   ALTER TABLE public.notes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    216    217            �           2604    20358    scheduledTask id    DEFAULT     x   ALTER TABLE ONLY public."scheduledTask" ALTER COLUMN id SET DEFAULT nextval('public."scheduledTask_id_seq"'::regclass);
 A   ALTER TABLE public."scheduledTask" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    222    223            �           2604    20359    tag id    DEFAULT     `   ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);
 5   ALTER TABLE public.tag ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    218    219            �           2604    20360    tagsToNote id    DEFAULT     r   ALTER TABLE ONLY public."tagsToNote" ALTER COLUMN id SET DEFAULT nextval('public."tagsToNote_id_seq"'::regclass);
 >   ALTER TABLE public."tagsToNote" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            `          0    20235    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public               postgres    false    209   M       b          0    20245    accounts 
   TABLE DATA           y   COPY public.accounts (id, name, nickname, password, image, "apiToken", note, role, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    211   �M       d          0    20262    attachments 
   TABLE DATA           {   COPY public.attachments (id, "isShare", "sharePassword", name, path, size, "noteId", "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    213   �M       f          0    20278    config 
   TABLE DATA           1   COPY public.config (id, key, config) FROM stdin;
    public               postgres    false    215   N       h          0    20288    notes 
   TABLE DATA           �   COPY public.notes (id, type, content, "isArchived", "isRecycle", "isShare", "isTop", "sharePassword", metadata, users, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    217   7N       n          0    20328    scheduledTask 
   TABLE DATA           ]   COPY public."scheduledTask" (id, name, schedule, "lastRun", "isSuccess", output) FROM stdin;
    public               postgres    false    223   �N       j          0    20306    tag 
   TABLE DATA           O   COPY public.tag (id, name, icon, parent, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    219   �N       l          0    20319 
   tagsToNote 
   TABLE DATA           =   COPY public."tagsToNote" (id, "noteId", "tagId") FROM stdin;
    public               postgres    false    221   .O                  0    0    accounts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.accounts_id_seq', 1, false);
          public               postgres    false    210            �           0    0    attachments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.attachments_id_seq', 1, true);
          public               postgres    false    212            �           0    0    config_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.config_id_seq', 1, false);
          public               postgres    false    214            �           0    0    notes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.notes_id_seq', 6, true);
          public               postgres    false    216            �           0    0    scheduledTask_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."scheduledTask_id_seq"', 1, false);
          public               postgres    false    222            �           0    0 
   tag_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.tag_id_seq', 1, true);
          public               postgres    false    218            �           0    0    tagsToNote_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."tagsToNote_id_seq"', 1, true);
          public               postgres    false    220            �           2606    20243 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public                 postgres    false    209            �           2606    20260    accounts accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public                 postgres    false    211            �           2606    20276    attachments attachments_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.attachments DROP CONSTRAINT attachments_pkey;
       public                 postgres    false    213            �           2606    20286    config config_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
       public                 postgres    false    215            �           2606    20304    notes notes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
       public                 postgres    false    217            �           2606    20337     scheduledTask scheduledTask_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."scheduledTask"
    ADD CONSTRAINT "scheduledTask_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."scheduledTask" DROP CONSTRAINT "scheduledTask_pkey";
       public                 postgres    false    223            �           2606    20317    tag tag_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public                 postgres    false    219            �           2606    20326    tagsToNote tagsToNote_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."tagsToNote"
    ADD CONSTRAINT "tagsToNote_pkey" PRIMARY KEY ("noteId", "tagId");
 H   ALTER TABLE ONLY public."tagsToNote" DROP CONSTRAINT "tagsToNote_pkey";
       public                 postgres    false    221    221            �           2606    20338 #   attachments attachments_noteId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT "attachments_noteId_fkey" FOREIGN KEY ("noteId") REFERENCES public.notes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.attachments DROP CONSTRAINT "attachments_noteId_fkey";
       public               postgres    false    3275    213    217            �           2606    20343 !   tagsToNote tagsToNote_noteId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."tagsToNote"
    ADD CONSTRAINT "tagsToNote_noteId_fkey" FOREIGN KEY ("noteId") REFERENCES public.notes(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public."tagsToNote" DROP CONSTRAINT "tagsToNote_noteId_fkey";
       public               postgres    false    217    221    3275            �           2606    20348     tagsToNote tagsToNote_tagId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."tagsToNote"
    ADD CONSTRAINT "tagsToNote_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES public.tag(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public."tagsToNote" DROP CONSTRAINT "tagsToNote_tagId_fkey";
       public               postgres    false    219    3277    221            `   �   x���Kj�@е}�샌���!r�� ����x��UY$((
�	y���U3@-jՀ��2��B�� B�q��)�s(�fS�d*�~Ir����=]��Z,������D?�����1^-!���s{|<��3Q<7�G�(��l�f@�PIr���+�S�D>�K�7�φ��[�8�}�D(U�      b      x������ � �      d      x������ � �      f      x������ � �      h   �   x���;
�0��:s���a�&zO`����?�B������|L8Q���z��<i[룐��4��D��&d�7��Ҹ'bƜc�,�^���u��+����Z��Z�����h�S�ػLO+�K�Ö`C 8 ��[M      n      x������ � �      j   6   x�3�424642��4�4202�54�52U02�20�25�323�6��#����� ���      l      x�3�4�4����� �\     