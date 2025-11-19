
{{- define "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.fullname" -}}
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


{{- define "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.labels" -}}
helm.sh/chart: {{ include "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.chart" . }}
{{ include "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0b7c6894-b485-4dcd-9770-f5090edbe0ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}