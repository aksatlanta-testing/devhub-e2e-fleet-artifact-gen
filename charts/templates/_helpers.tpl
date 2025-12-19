
{{- define "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.fullname" -}}
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


{{- define "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.labels" -}}
helm.sh/chart: {{ include "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.chart" . }}
{{ include "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedc3a982-26f1-4bb8-93af-bc8f30cc0444.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}