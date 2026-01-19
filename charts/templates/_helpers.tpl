
{{- define "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.fullname" -}}
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


{{- define "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.labels" -}}
helm.sh/chart: {{ include "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.chart" . }}
{{ include "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9ca03cf-2be7-4f19-bacf-21d6204da9bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}