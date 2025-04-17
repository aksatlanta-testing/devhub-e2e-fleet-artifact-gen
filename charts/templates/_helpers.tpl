
{{- define "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.fullname" -}}
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


{{- define "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.labels" -}}
helm.sh/chart: {{ include "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.chart" . }}
{{ include "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo31309f40-8128-4268-b0d9-24660b3ad5ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}