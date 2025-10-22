
{{- define "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.fullname" -}}
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


{{- define "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.labels" -}}
helm.sh/chart: {{ include "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.chart" . }}
{{ include "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a12c3a3-943b-4bb0-960e-bf27f5464c81.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}