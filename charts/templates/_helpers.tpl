
{{- define "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.fullname" -}}
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


{{- define "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.labels" -}}
helm.sh/chart: {{ include "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.chart" . }}
{{ include "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe42aa6e-4168-4a3c-8dc7-e3284e80777a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}