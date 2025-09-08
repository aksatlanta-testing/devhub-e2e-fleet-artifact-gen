
{{- define "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.fullname" -}}
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


{{- define "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.labels" -}}
helm.sh/chart: {{ include "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.chart" . }}
{{ include "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1ee90b9-07c8-485e-97ba-b3231a7ebad7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}