
{{- define "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.fullname" -}}
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


{{- define "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.labels" -}}
helm.sh/chart: {{ include "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.chart" . }}
{{ include "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc218d54b-6c9e-4d72-a7db-4dfd501be8bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}