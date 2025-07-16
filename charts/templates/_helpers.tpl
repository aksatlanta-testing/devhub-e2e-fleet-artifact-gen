
{{- define "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.fullname" -}}
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


{{- define "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.labels" -}}
helm.sh/chart: {{ include "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.chart" . }}
{{ include "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo920a5e8b-afb7-4117-8282-18e0b10205da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}