
{{- define "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.fullname" -}}
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


{{- define "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.labels" -}}
helm.sh/chart: {{ include "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.chart" . }}
{{ include "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe12abfa6-3607-48d1-acb1-2d35168da259.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}