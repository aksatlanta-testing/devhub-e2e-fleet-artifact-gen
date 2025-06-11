
{{- define "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.labels" -}}
helm.sh/chart: {{ include "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.chart" . }}
{{ include "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe39adefe-9ded-463c-a02a-a525ed5e3879.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}