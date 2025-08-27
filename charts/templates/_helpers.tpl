
{{- define "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.fullname" -}}
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


{{- define "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.labels" -}}
helm.sh/chart: {{ include "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.chart" . }}
{{ include "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe1ac58d4-edfe-4324-a23b-764eb33bc286.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}