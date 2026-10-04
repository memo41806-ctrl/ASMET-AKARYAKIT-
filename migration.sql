CREATE TABLE "fuel_logs" (
	"id" serial PRIMARY KEY,
	"vehicle_id" integer NOT NULL,
	"plate" text NOT NULL,
	"company_name" text NOT NULL,
	"discount_rate" numeric(5,2) NOT NULL,
	"gross_amount" numeric(12,2) NOT NULL,
	"discount_amount" numeric(12,2) NOT NULL,
	"net_amount" numeric(12,2) NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "vehicles" (
	"id" serial PRIMARY KEY,
	"plate" text NOT NULL UNIQUE,
	"company_name" text NOT NULL,
	"discount_rate" numeric(5,2) NOT NULL,
	"fuel_type" text NOT NULL,
	"payment_term" text NOT NULL,
	"adblue_on_credit" boolean DEFAULT false NOT NULL,
	"free_wash" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE INDEX "fuel_logs_vehicle_id_idx" ON "fuel_logs" ("vehicle_id");--> statement-breakpoint
ALTER TABLE "fuel_logs" ADD CONSTRAINT "fuel_logs_vehicle_id_vehicles_id_fkey" FOREIGN KEY ("vehicle_id") REFERENCES "vehicles"("id") ON DELETE CASCADE;