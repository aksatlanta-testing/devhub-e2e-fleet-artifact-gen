
{{- define "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.fullname" -}}
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


{{- define "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.labels" -}}
helm.sh/chart: {{ include "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.chart" . }}
{{ include "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc2110b3b-2253-42ee-8b04-ad2160dfef6b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}