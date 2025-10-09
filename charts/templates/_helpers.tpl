
{{- define "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.fullname" -}}
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


{{- define "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.labels" -}}
helm.sh/chart: {{ include "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.chart" . }}
{{ include "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocdc2286e-41a5-47cc-9a68-505f1cff4a0c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}