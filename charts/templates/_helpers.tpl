
{{- define "go-echo623b68d8-979c-4826-b117-c795a0c563ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo623b68d8-979c-4826-b117-c795a0c563ea.fullname" -}}
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


{{- define "go-echo623b68d8-979c-4826-b117-c795a0c563ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo623b68d8-979c-4826-b117-c795a0c563ea.labels" -}}
helm.sh/chart: {{ include "go-echo623b68d8-979c-4826-b117-c795a0c563ea.chart" . }}
{{ include "go-echo623b68d8-979c-4826-b117-c795a0c563ea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo623b68d8-979c-4826-b117-c795a0c563ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo623b68d8-979c-4826-b117-c795a0c563ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}