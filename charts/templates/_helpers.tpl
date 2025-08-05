
{{- define "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.fullname" -}}
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


{{- define "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.labels" -}}
helm.sh/chart: {{ include "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.chart" . }}
{{ include "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5eb39fc-ec9f-471d-87c9-735cae7e667a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}